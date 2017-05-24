import React, { PureComponent } from 'react'
import injectSheet from 'react-jss'

const styles = {
  card: {
    padding: 10,
    position: 'relative',
    left: '50%',
    width: 230,
    marginLeft: -90,
    marginBottom: 20,
    background: '#fff',
  	borderRadius: 2,
    textAlign: 'left',
    boxShadow: '0 10px 20px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)',
  },
  title: {
    fontWeight: 700,
  }
}

class LanguageTooltip extends PureComponent {
  render() {
    const { active, classes } = this.props;

    if (active) {
      const { payload, label } = this.props;
      return (
        <div className={classes.card}>
          <p className={classes.title}>{payload[0].payload.name}</p>
          <p>{`${payload[0].name} => ${payload[0].value} ${payload[0].unit}`}</p>
          <p>{`${payload[1].name} => ${payload[1].value} ${payload[1].unit}`}</p>
        </div>
      );
    }

    return null;
  }
}

export default injectSheet(styles)(LanguageTooltip)
