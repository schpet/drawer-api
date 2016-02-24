import React from 'react'
import { connect } from 'react-redux'
import Dropzone from 'react-dropzone'
import request from 'superagent'

class NewDocument extends React.Component {
  constructor (props) {
    super(props)
    this.state = {}
  }

  uploadFile (keys, files) {
    let fd = this.buildFormData(keys.fields, files)

    request
      .post(keys.url)
      .send(fd)
      .set('Accept', 'XML')
      .on('progress', (e) => {
        console.log('Percentage done: ', e.percent)
      })
      .end((err, res) => {
        // Calling the end function will send the request
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
  uploadFileFetch (keys, file) {
    const { fields } = keys
    let data = new FormData()
    for (var prop in fields) {
      if (fields.hasOwnProperty(prop)) {
        data.append(prop, fields[prop])
      }
    }
    data.append('file', file)

    console.log(data)
    fetch(keys.url,
      {
        method: 'POST',
        body: data,
        headers: {
          'Accept': 'XML'
        }
      }
    ).then((response) => {
      console.log('have response!!')
      console.log(response)
    })
  }

  // deleteme
  uploadFileXHR (keys, file) {
    const { fields } = keys
    var uri = keys.url
    var xhr = new XMLHttpRequest()
    var fd = new FormData()

    xhr.open('POST', uri, true)
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4 && xhr.status === 201) {
        console.log("success!")
      }
    }

    for (var prop in fields) {
      if (fields.hasOwnProperty(prop)) {
        fd.append(prop, fields[prop])
      }
    }
    fd.append('file', file)

    // Initiate a multipart/form-data upload
    xhr.send(fd)
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
