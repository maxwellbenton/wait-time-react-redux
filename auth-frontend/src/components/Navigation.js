import React from 'react'
import {Link} from 'react-router-dom'
import { Menu, Input} from 'semantic-ui-react'

const Navigation = ({logout}) => {
  return (
    <Menu pointing>
      <Menu.Item name='home' > <Link to='/'>Home</Link></Menu.Item>
      <Menu.Item name='cards' > <Link to='/map'>Store Map</Link></Menu.Item>
      <Menu.Item name='login' ><Link to='/user'>User</Link></Menu.Item>
      <Menu.Item name='login' ><Link to='/login'>Log In </Link></Menu.Item>
      <Menu.Item name='logout' onClick={logout} />
      <Menu.Menu position='right'>
        <Menu.Item>
          <Input icon='search' placeholder='Search...' />
        </Menu.Item>
      </Menu.Menu>
    </Menu>
  )
}

export default Navigation
