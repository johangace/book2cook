import React from 'react'
import TableRow from './TableRow'

const Table = props => (
  <table className="table">
    <thead>
      <tr>
        <th style={{width: '70%'}}>Name</th>
        <th style={{width: '15%'}}>Author</th>
      </tr>
    </thead>
    <tbody>
      {props.recipes.map((recipe, index) => (
        <TableRow key={index} {...recipe} />
      ))}
    </tbody>
  </table>
)

export default Table
