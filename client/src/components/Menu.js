import React from 'react'
// import { connect } from 'react-redux'
import { Link } from 'react-router'

export const Menu = () => (
  <div id='menu'>
    <ul>
      <li><Link to='/'>Home</Link></li>
      <li><Link to='/about'>About</Link></li>
    </ul>
  </div>
)
