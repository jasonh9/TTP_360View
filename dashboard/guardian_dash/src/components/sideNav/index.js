import React from 'react';
import DispatchLogo from '../dispatchLogo';
import ActiveUsers from '../userButton';
import './index.css';

class SideNav extends React.Component {
    render(){
        return (
            <div className="sideNav">
                <DispatchLogo />
                <h1>Users</h1>
                <ActiveUsers />
            </div>
        )
    }
}

export default SideNav;