import React, {Component} from 'react'
import axios from 'axios'


export default class Recipes extends Component {
  state = {
    recipes     : [{},{},{},{},{}],
  }

  fetchRecipes = () => {
    axios.get(`/recipes.json`)
      .then(response => {
        const{recipes} = response.data
        this.setState({recipes})
      })
  }

  render(){
    const { recipes } = this.state
    return(
      <ul>
        {
          recipes.map((recipe, index) => {
            return(
              <li key={index}>{recipe.name}</li>
            )
          })
        }
      </ul>
    )
  }

  componentDidMount(){
    this.fetchRecipes()
  }
}
