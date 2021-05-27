import { environment } from '@rails/webpacker'
import { ProvidePlugin } from 'webpack'
environment.plugins.append('Provide', new ProvidePlugin({
  Popper: ['popper.js', 'default']
}))
export default environment
