import React from 'react'
import { connect } from 'react-redux'
import Dropzone from 'react-dropzone'

class NewDocument extends React.Component {
  onDrop (files) {
    console.log('Received files: ', files)
  }

  onOpenClick () {
    this.refs.dropzone.open()
  }

  render () {
    return (
      <div>
        <Dropzone ref='dropzone' onDrop={this.onDrop.bind(this)} />
        <button type='button' onClick={this.onOpenClick.bind(this)}>
            Open Dropzone
        </button>
      </div>
    )
  }
}

Document.propTypes = {
}

export default connect()(NewDocument)
