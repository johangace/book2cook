import React from 'react'

const TableRow = props => (
  <tr id={`recipe_${props.id}`}>
    <td>
      {props.name}
    </td>
    <td>
      {props.author}
    </td>
  </tr>
)

export default TableRow
