import React from 'react'
import { connect } from 'react-redux'

class Document extends React.Component {
  render () {
    const { id } = this.props.doc
    const { filename, mime_type, file_size, url } = this.props.doc.attributes

    if (mime_type === 'image/jpeg' || mime_type === 'image/png' || mime_type === 'image/gif') {
      return (
        <div>
          <a href={url}>
            <img src={url} title={filename} width="200" />
          </a>
        </div>
      )
    }

    if (mime_type === 'video/quicktime') {
      return (
        <div>
          <div>
            <a href={url}>{filename}</a>
          </div>
          <video width='400' height='300' preload controls>
            <source src={url} />
          </video>
        </div>
      )
    }


    return (
      <div>
        <a href={url}>{filename}</a>
        ({mime_type})
      </div>
    )
  }
}

Document.propTypes = {
  doc: React.PropTypes.object.isRequired
}

export default connect()(Document)
