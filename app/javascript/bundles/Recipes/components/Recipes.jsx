import React, {Component} from 'react'
import axios from 'axios'
import Table from './Table'
import Search from './Search'

export default class Recipes extends Component {
  state = {
    recipes     : [{},{},{},{},{}],
    term        : ''
  }

  componentDidMount(){
    const {term} = this.state
    this.fetchRecipes(term)
  }

  fetchRecipes = (term) => {
    axios.get(`/recipes.json?term=${term}`)
      .then(response => {
        const{recipes} = response.data
        this.setState({recipes, term})
      })
  }
  handleSearch = event => {
    const term = event.target.value
    this.fetchRecipes(term)
  }

  render(){
    const { recipes, term } = this.state
    return(
      <React.Fragment>
        <Search
          term={term}
          handleSearch={this.handleSearch}
          invalid={ term.length > 0 && recipes.length === 0 }
        />
        <Table recipes={recipes}/>
      </React.Fragment>
    )
  }
}

