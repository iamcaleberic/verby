import React, { Component } from 'react'
import { Sidebar, Segment, Button, Menu, Image, Icon, Header } from 'semantic-ui-react'

import Skeleton from './Skeleton'

import orange from '../images/orange-banner.png'

export default class Main extends Component {
  state = { visible: false }

  toggleVisibility = () => this.setState({ visible: !this.state.visible })
  handleItemClick = (e, { name }) => this.setState({ activeItem: name })

  render() {
    const { visible, activeItem } = this.state
    return (
      <div>
        <Sidebar.Pushable as={Segment}>
          <Sidebar as={Menu} animation='push' width='thin' visible={visible} icon='labeled' vertical inverted>
            <Menu.Item >
              <Image avatar={true} size='tiny' src={orange} />
            </Menu.Item>
            <a href="/"><Menu.Item name='home'>
              <Icon name='home' link/>
              Home
            </Menu.Item></a>
            <a href='/writers/sign_in'><Menu.Item name='publish'>
              <Icon name='folder' link />
              Publish
            </Menu.Item></a>
            <a href='/static/about'><Menu.Item name='icon'>
              <Icon name='info' link />
              About
            </Menu.Item></a>
            <a href='/static/terms'><Menu.Item name='terms'>
              <Icon name='book' link />
              Terms
            </Menu.Item></a>
          </Sidebar>
          <Sidebar.Pusher>
            <Segment basic>
              <Menu secondary>
                <Menu.Item icon='sidebar' onClick={this.toggleVisibility} />
                <Menu.Item active={activeItem === 'home'} onClick={this.handleItemClick} >
                  <Image avatar={true} size='tiny' src={orange} />
                </Menu.Item>
                <Menu.Item name='messages' active={activeItem === 'messages'} onClick={this.handleItemClick} />
                <Menu.Item name='friends' active={activeItem === 'friends'} onClick={this.handleItemClick} />
                <Menu.Menu position='right'>
                  <Menu.Item>
                  </Menu.Item>
                  <Menu.Item name='logout' active={activeItem === 'logout'} onClick={this.handleItemClick} />
                </Menu.Menu>
              </Menu>

              <Skeleton />
            </Segment>
          </Sidebar.Pusher>
        </Sidebar.Pushable>
      </div>
    )
  }
}
