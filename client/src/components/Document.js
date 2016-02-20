import React from 'react'
import { connect } from 'react-redux'

class Document extends React.Component {
  render () {
    const { id } = this.props

    return (
      <div>
        document:
        {id}
      </div>
    )
  }
}

Document.propTypes = {
  id: React.PropTypes.string.isRequired
}

export default connect()(Document)
