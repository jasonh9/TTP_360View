import React from 'react';
import DispatchLogo from '../dispatchLogo';
import ActiveUsers from '../userButton';
import './index.css';


class SideNav extends React.Component {
    componentDidMount(){    
    }
    render(){
        return (
            <div className="sideNav">
                <DispatchLogo />
                <ActiveUsers />
            </div>
        )
    }
}

export default SideNav;