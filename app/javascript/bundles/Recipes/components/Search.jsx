import React from 'react'

const Search = props => (
  <div className="form-group">
    <input
      id= "term"
      type="search"
      placeholder="Search"
      autoComplete="off"
      onChange={props.handleSearch}
      value={props.term}
      className={
        props.invalid             ?
        "form-control is-invalid" :
        "form-control"
      }
    />
  </div>
)

export default Search
