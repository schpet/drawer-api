import React from 'react'
import { connect } from 'react-redux'
import Dropzone from 'react-dropzone'
import request from 'superagent'

class NewDocument extends React.Component {
  constructor (props) {
    super(props)
    this.state = {}
  }

  uploadFile (keys, file) {
    let fd = this.buildFormData(keys.fields, file)

    request
      .post(keys.url)
      .send(fd)
      .set('Accept', 'XML')
      .on('progress', (e) => {
        console.log('Percentage done: ', e.percent)
      })
      .end((err, res) => {
        console.log('success!')
        console.log(res)
      })
  }

  buildFormData (fields, file) {
    let data = new FormData()
    for (var prop in fields) {
      if (fields.hasOwnProperty(prop)) {
        data.append(prop, fields[prop])
      }
    }
    data.append('file', file)
    return data
  }

  onDrop (files) {
    files.forEach((file) => {
      fetch('http://localhost:3000/api/upload_keys',
        {
          method: 'POST',
          headers: { 'Authorization': localStorage.getItem('jwt') }
        })
        .then((response) => response.json())
        .then((json) => { this.uploadFile(json, file) })
    })

    // new S3Upload({
    //   fileElement: findDOMNode(this),
    //   signingUrl: this.props.signingUrl,
    //   onProgress: this.props.onProgress,
    //   onFinishS3Put: this.props.onFinish,
    //   onError: this.props.onError,
    //   signingUrlHeaders: this.props.signingUrlHeaders,
    //   signingUrlQueryParams: this.props.signingUrlQueryParams,
    //   uploadRequestHeaders: this.props.uploadRequestHeaders,
    //   contentDisposition: this.props.contentDisposition,
    //   server: this.props.server
    // });
  }

  onOpenClick () {
    this.refs.dropzone.open()
  }

  componentDidMount () {

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
