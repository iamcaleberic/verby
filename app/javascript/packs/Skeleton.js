import React, { Component } from 'react'
import { Header, Button, Segment, Container, Image, Icon } from 'semantic-ui-react'

import logo from '../images/logo.png'

export default class Skeleton extends Component {
  render(){
    return (
      <Container textAlign='center'>
        <Image src={logo} size='large' centered/>
        <Header as='h2' content='EVERYBODY LOVES A GOOD STORY'/>
        <Header content='Connecting creatives and consumers of creative content from the convenience of their devices' />
        <Button className='rw' size='small' color='green' inverted as='a' href='writers/sign_up'>Start Writing</Button>
        <Button className='rw' size='small' color='blue' inverted as='a' href='publications'>Start Reading</Button>
        <br/>
        <a href="http://instagram.com/verbyink"><Icon name='instagram' className='ig' circular={true} color='purple' inverted link /></a>
      </Container>
    )
  }
}
