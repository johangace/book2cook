import React from 'react'
import StripeCheckout from 'react-stripe-checkout';
import axios from 'axios';

const csrfHeaders = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN':     ReactOnRails.authenticityToken()
}

export default class Checkout extends React.Component {
  onToken = (token, addresses) => {
    axios.post(`/books/${this.props.book_id}/purchase`, {}, {headers: csrfHeaders})
      .then(response => Turbolinks.visit(response.data.location))
  }

  render() {
    return (
      <StripeCheckout
        stripeKey="pk_test_fjoE929GjtKHfD6EwgqN8Wh000thMsevKx"
        amount={this.props.price}
        token={this.onToken}
        label="Buy Now"
        description={this.props.description}
        name={this.props.name}
        image={this.props.image}
        locale="auto"
        email={this.props.email}
      />
    )
  }
}
