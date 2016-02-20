import React from 'react'
import { connect } from 'react-redux'

class Document extends React.Component {
  render () {
    const { id } = this.props.doc

    return (
      <div>
        <b>document:</b>
        {id}
      </div>
    )
  }
}

Document.propTypes = {
  doc: React.PropTypes.object.isRequired
}

export default connect()(Document)
