import React, {Component} from 'react'
import axios from 'axios'

 export default class Search extends Component {
  state = {
    results     : [{},{},{},{},{}],
    term        : ''
  }
  handleSearch = event => {
    const term = event.target.value
    axios.get(`/search.json?term=${term}`)
      .then(response => {
        const{results} = response.data
        this.setState({results, term})
      })
  }

   render(){
    const { results, term } = this.state
    return(
      <React.Fragment>
        <input 
          className="form-control mr-sm-2"
          type='search'
          name= 'term'
          placeholder='Search'
          autoComplete= 'off'
          value= {term}
          onChange={this.handleSearch}
          />
        { results.length > 0 && 
        <ul className="list-group" style={{position: 'absolute', zIndex: 10}}>
          {
            results.map((result, i) =>{
              return(
                <li key={i}>
                  <a href={result.location}>
                    {result.name}
                  </a>
                </li>
              )
            })
          }
        </ul>
      }
      </React.Fragment>
    )
  }
}
