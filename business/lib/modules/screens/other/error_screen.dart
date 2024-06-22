import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jars/jars.dart';

class SvgPatten {
  SvgPatten._();
  static const gCube =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="268" height="263" fill="currentColor" viewBox="0 0 268 263">
  <path fill-opacity=".3" d="m134 .31 116.047 65.5v131L134 262.31l-116.047-65.5v-131L134 .31Z"/>
  <path fill-opacity=".5" d="m134 20.31 96.129 55.5v111L134 242.31l-96.129-55.5v-111L134 20.31Z"/>
  <path d="m134 47.31 72.746 42v84l-72.746 42-72.746-42v-84l72.746-42Z"/>
</svg>''';

  static const gCircle =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="393" height="393" fill="none" viewBox="0 0 393 393">
  <circle cx="196.323" cy="196.626" r="196" fill="url(#a)" fill-opacity=".4"/>
  <circle cx="196.323" cy="196.626" r="162" fill="#fff" fill-opacity=".5"/>
  <circle cx="196.323" cy="196.626" r="130" fill="#fff" fill-opacity=".6"/>
  <circle cx="196.323" cy="196.626" r="98" fill="#fff" fill-opacity=".6"/>
  <defs>
    <linearGradient id="a" x1="196.323" x2="196.323" y1=".626" y2="392.626" gradientUnits="userSpaceOnUse">
      <stop stop-color="#fff"/>
      <stop offset="1" stop-color="none" stop-opacity="0"/>
    </linearGradient>
  </defs>
</svg>''';

  static const gCircleBorder =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="345" height="345" fill="none" viewBox="0 0 345 345">
  <circle cx="172.483" cy="172.68" r="171.5" stroke="url(#a)"/>
  <circle cx="172.483" cy="172.68" r="138.5" stroke="url(#b)"/>
  <circle cx="172.483" cy="172.68" r="110.5" stroke="url(#c)"/>
  <circle cx="172.483" cy="172.68" r="79.5" stroke="url(#d)"/>
  <defs>
    <linearGradient id="a" x1="172.483" x2="172.483" y1=".68" y2="344.68" gradientUnits="userSpaceOnUse">
      <stop/>
      <stop offset="1" stop-color="none" stop-opacity="0"/>
    </linearGradient>
    <linearGradient id="b" x1="172.483" x2="172.483" y1="33.68" y2="311.68" gradientUnits="userSpaceOnUse">
      <stop/>
      <stop offset="1" stop-color="none" stop-opacity="0"/>
    </linearGradient>
    <linearGradient id="c" x1="172.483" x2="172.483" y1="61.68" y2="283.68" gradientUnits="userSpaceOnUse">
      <stop/>
      <stop offset="1" stop-color="none" stop-opacity="0"/>
    </linearGradient>
    <linearGradient id="d" x1="172.483" x2="172.483" y1="92.68" y2="252.68" gradientUnits="userSpaceOnUse">
      <stop/>
      <stop offset="1" stop-color="none" stop-opacity="0"/>
    </linearGradient>
  </defs>
</svg>''';

  static const defaultError =
      '''<svg enable-background="new 0 0 500 500" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><path d="m0 382.398h500v.25h-500z" fill="#ebebeb"/><path d="m416.779 398.494h33.122v.25h-33.122z" fill="#ebebeb"/><path d="m260.335 395.361h12.887v.25h-12.887z" fill="#ebebeb"/><path d="m322.527 396.417h27.14v.25h-27.14z" fill="#ebebeb"/><path d="m359.667 389.208h56.111v.25h-56.111z" fill="#ebebeb"/><path d="m52.459 400.778h26.527v.25h-26.527z" fill="#ebebeb"/><path d="m87.889 400.778h23v.25h-23z" fill="#ebebeb"/><path d="m131 395.236h60.814v.25h-60.814z" fill="#ebebeb"/><path d="m237.014 337.8h-193.099c-3.147 0-5.708-2.561-5.708-5.708v-271.432c0-3.147 2.561-5.708 5.708-5.708h193.099c3.146 0 5.707 2.561 5.707 5.708v271.432c0 3.147-2.561 5.708-5.707 5.708zm-193.099-282.597c-3.01 0-5.458 2.448-5.458 5.458v271.432c0 3.01 2.448 5.458 5.458 5.458h193.099c3.009 0 5.457-2.448 5.457-5.458v-271.433c0-3.009-2.448-5.458-5.457-5.458h-193.099z" fill="#ebebeb"/><path d="m453.31 337.8h-193.098c-3.147 0-5.707-2.561-5.707-5.708v-271.432c0-3.147 2.561-5.708 5.707-5.708h193.098c3.148 0 5.708 2.561 5.708 5.708v271.432c.001 3.147-2.56 5.708-5.708 5.708zm-193.098-282.597c-3.009 0-5.457 2.448-5.457 5.458v271.432c0 3.01 2.448 5.458 5.457 5.458h193.098c3.01 0 5.458-2.448 5.458-5.458v-271.433c0-3.009-2.448-5.458-5.458-5.458h-193.098z" fill="#ebebeb"/><path d="m467.064 194.172c3.255-11.284 2.658-22.76-.991-33.044 2.852-4.083 5.103-8.689 6.56-13.742 6.697-23.218-5.515-47.403-27.538-56.106-4.25-30.415-25.837-57-57.252-66.06-24.837-7.163-50.307-1.778-69.671 12.389-4.846-5.072-11.048-8.975-18.274-11.059-21.781-6.282-44.531 6.283-50.812 28.063-1.051 3.643-1.563 7.312-1.604 10.927-21.919 4.415-40.689 20.572-47.314 43.54-5.951 20.634-.684 41.839 12.192 57.11-1.664 3.007-3.031 6.237-4.024 9.68-7.131 24.726 7.132 50.551 31.858 57.682 8.153 2.352 16.422 2.364 24.105.455 9.09 12.533 22.256 22.251 38.285 26.874 20.626 5.949 41.737 2.249 58.541-8.415 7.521 17.494 13.704 43.732.397 69.462 48.344-4.742 83.256-51.113 76.141-93.597 13.795-6.348 24.862-18.422 29.401-34.159z" fill="#ebebeb"/><path d="m374.317 312.332c-.261 0-.515-.102-.706-.291-.258-.257-.356-.635-.255-.985 6.81-23.717.604-46.456-5.801-61.355l-3.245-7.547-6.937 4.402c-10.474 6.646-22.518 10.16-34.829 10.16-6.066 0-12.129-.861-18.021-2.56-14.034-4.048-25.983-12.437-34.558-24.26l-2.772-3.822-4.582 1.14c-6.718 1.67-13.791 1.538-20.476-.388-10.162-2.931-18.574-9.644-23.689-18.902-5.113-9.259-6.315-19.953-3.384-30.115.819-2.837 1.971-5.606 3.423-8.23l2.334-4.218-3.107-3.685c-11.864-14.069-15.909-33.007-10.818-50.657 5.698-19.754 21.78-34.551 41.971-38.617l5.553-1.118.064-5.665c.035-3.077.482-6.127 1.33-9.066 4.181-14.497 17.625-24.622 32.693-24.622 3.183 0 6.364.452 9.454 1.344 5.773 1.665 11.013 4.836 15.152 9.17l4.24 4.438 4.955-3.623c12.515-9.157 27.887-14.2 43.283-14.2 6.838 0 13.673.971 20.314 2.886 27.746 8.003 48.259 31.674 52.259 60.304l.564 4.041 3.795 1.501c19.001 7.51 29.055 27.997 23.385 47.656-1.205 4.177-3.08 8.104-5.573 11.672l-2.064 2.954 1.205 3.397c3.305 9.314 3.604 19.259.863 28.763-3.796 13.159-13.128 23.999-25.602 29.739l-4.862 2.237.884 5.278c3.036 18.129-2.425 37.931-14.983 54.33-10.46 13.657-25.083 23.77-41.177 28.475-.092.026-.186.039-.28.039zm-9.551-72.651c.099 0 .199.015.295.045.28.086.507.291.623.561l3.708 8.625c6.376 14.83 12.552 37.293 6.37 60.934 15.006-4.789 28.598-14.412 38.425-27.244 12.223-15.96 17.544-35.199 14.599-52.783l-1.01-6.032c-.075-.445.158-.885.568-1.073l5.556-2.557c11.946-5.498 20.881-15.877 24.516-28.478 2.624-9.1 2.338-18.622-.826-27.54l-1.377-3.882c-.108-.304-.063-.642.122-.906l2.358-3.376c2.367-3.389 4.147-7.117 5.291-11.082 5.383-18.663-4.161-38.113-22.199-45.242l-4.337-1.715c-.335-.132-.573-.435-.622-.791l-.645-4.618c-3.892-27.85-23.845-50.875-50.833-58.659-6.461-1.863-13.11-2.808-19.76-2.808-14.975 0-29.927 4.906-42.103 13.814l-5.662 4.142c-.405.297-.967.246-1.313-.116l-4.846-5.072c-3.896-4.078-8.827-7.062-14.261-8.629-2.91-.84-5.904-1.266-8.899-1.266-14.182 0-26.835 9.53-30.771 23.177-.798 2.766-1.219 5.637-1.251 8.534l-.073 6.474c-.005.472-.34.875-.803.969l-6.347 1.278c-19.456 3.918-34.953 18.177-40.443 37.211-4.905 17.007-1.007 35.255 10.426 48.814l3.551 4.211c.267.316.311.766.11 1.129l-2.667 4.82c-1.38 2.492-2.474 5.122-3.251 7.815-2.783 9.647-1.642 19.803 3.213 28.594s12.843 15.165 22.491 17.947c6.349 1.83 13.063 1.954 19.44.368l5.237-1.302c.394-.101.811.052 1.051.384l3.168 4.368c8.311 11.458 19.892 19.589 33.493 23.512 5.712 1.648 11.588 2.482 17.467 2.482 11.931 0 23.604-3.406 33.757-9.85l7.928-5.03c.162-.105.348-.157.536-.157z" fill="#fff"/><path d="m304.191 146.189-26.804-4.173.417-2.68c.71-4.561 1.803-8.184 3.281-10.868s3.422-5.042 5.834-7.076c2.411-2.032 7.652-5.455 15.723-10.266 4.293-2.512 6.639-5.059 7.042-7.645s-.049-4.715-1.353-6.388c-1.305-1.673-3.509-2.75-6.613-3.234-3.339-.52-6.274.156-8.804 2.024-2.531 1.87-4.531 5.508-5.999 10.916l-26.841-7.647c2.507-9.917 7.423-17.448 14.752-22.591 7.327-5.146 17.574-6.693 30.741-4.643 10.251 1.596 18.194 5.025 23.829 10.285 7.658 7.115 10.736 15.495 9.236 25.133-.623 3.999-2.328 7.682-5.117 11.053s-8.009 7.206-15.662 11.504c-5.336 3.024-8.804 5.577-10.405 7.664s-2.686 4.964-3.257 8.632zm-28.831 2.809 28.708 4.469-3.942 25.322-28.708-4.469z" fill="#fff"/><path d="m372.593 185.424-14.882-12.055 1.205-1.488c2.051-2.533 4.004-4.356 5.858-5.47 1.854-1.115 3.877-1.864 6.071-2.25 2.193-.385 6.606-.616 13.239-.69 3.511-.011 5.847-.733 7.01-2.169s1.643-2.896 1.44-4.379c-.203-1.484-1.167-2.924-2.89-4.32-1.854-1.502-3.885-2.13-6.092-1.887-2.208.244-4.719 1.755-7.533 4.536l-13.672-14.188c5.047-5.164 10.72-8.017 17.018-8.558 6.298-.542 13.101 2.148 20.411 8.069 5.691 4.61 9.323 9.521 10.898 14.73 2.151 7.059 1.057 13.267-3.277 18.618-1.798 2.22-4.146 3.863-7.044 4.932s-7.445 1.558-13.641 1.467c-4.33-.047-7.352.281-9.069.988-1.718.707-3.401 2.078-5.05 4.114zm-18.596-8.511 15.939 12.911-11.388 14.059-15.939-12.911z" fill="#fff"/><path d="m376.753 98.804-6.441-8.795.879-.644c1.497-1.096 2.836-1.816 4.018-2.161 1.182-.344 2.405-.463 3.668-.357s3.725.62 7.387 1.542c1.934.504 3.325.445 4.173-.176.849-.621 1.325-1.355 1.428-2.201s-.218-1.778-.964-2.797c-.802-1.096-1.829-1.737-3.079-1.923-1.251-.186-2.852.281-4.805 1.403l-5.466-9.794c3.528-2.11 7.064-2.857 10.609-2.24 3.545.616 6.899 3.084 10.063 7.404 2.464 3.364 3.75 6.594 3.86 9.69.159 4.198-1.344 7.456-4.506 9.772-1.312.961-2.843 1.525-4.593 1.692s-4.324-.223-7.721-1.173c-2.376-.654-4.088-.912-5.135-.773-1.046.139-2.171.65-3.375 1.531zm-8.999-7.384 6.899 9.42-8.309 6.085-6.899-9.42z" fill="#fff"/><path d="m128.335 223.574c-8.269 0-16.587-2.265-23.959-6.658-10.147-6.047-17.318-15.42-19.754-25.785-8.237-.593-15.826-4.638-20.893-11.159-3.666-4.718-5.761-10.345-6.073-16.297-2.174-1.478-4.093-3.278-5.707-5.355-7.887-10.15-6.896-24.399 2.249-33.336-3.813-16.257 2.198-33.313 15.391-43.564 10.349-8.043 23.531-10.868 36.271-7.798 1.482-3.376 3.793-6.344 6.714-8.613 4.694-3.647 10.528-5.248 16.427-4.51 5.899.74 11.156 3.733 14.804 8.428 1.099 1.415 2.024 2.96 2.755 4.6 12.034-1.97 24.083 2.733 31.575 12.375 6.7 8.621 8.717 19.922 5.443 30.33 1.311 1.12 2.501 2.363 3.542 3.704 8.512 10.954 6.525 26.792-4.429 35.305-3.345 2.6-7.302 4.314-11.475 4.977-2.179 8.161-6.851 15.207-13.536 20.401-8.439 6.559-19.246 9.296-29.788 7.578-.106 9.715 2.152 22.885 13.025 32.301.217.188.314.479.253.761-.062.281-.272.506-.548.586-3.998 1.158-8.137 1.728-12.287 1.729zm-32.608-149.593c-9.032 0-17.842 2.979-25.175 8.677-12.824 9.966-18.603 26.605-14.723 42.393.067.274-.018.564-.224.759-8.86 8.355-9.899 21.919-2.417 31.548 1.59 2.046 3.496 3.806 5.664 5.229.212.14.344.372.354.626.224 5.77 2.217 11.232 5.763 15.796 4.909 6.317 12.319 10.178 20.33 10.592.354.018.651.27.726.616 2.209 10.173 9.191 19.413 19.155 25.352 10.276 6.125 22.452 7.968 33.629 5.143-10.731-10.037-12.725-23.659-12.468-33.466.006-.23.113-.445.292-.59.179-.144.411-.201.638-.161 10.387 1.951 21.119-.643 29.448-7.113 6.544-5.086 11.078-12.021 13.109-20.056.079-.311.337-.542.654-.585 4.092-.562 7.981-2.199 11.247-4.737 10.271-7.982 12.134-22.832 4.153-33.104-1.078-1.387-2.325-2.665-3.709-3.797-.252-.206-.35-.546-.248-.854 3.339-10.051 1.46-21.034-5.028-29.383-7.26-9.343-19.011-13.818-30.671-11.688-.365.067-.725-.131-.867-.473-.712-1.727-1.651-3.347-2.792-4.815-3.391-4.363-8.277-7.146-13.76-7.833-5.483-.692-10.906.801-15.269 4.191-2.883 2.241-5.126 5.212-6.487 8.592-.147.365-.545.564-.923.467-3.453-.889-6.944-1.326-10.401-1.326z" fill="#e6e6e6"/><path d="m100.595 139.957-13.813 3.252-.325-1.381c-.553-2.351-.736-4.322-.548-5.913.188-1.592.667-3.117 1.435-4.578.769-1.46 2.635-4.15 5.601-8.07 1.586-2.062 2.222-3.759 1.909-5.091-.314-1.333-.951-2.276-1.913-2.83s-2.242-.643-3.842-.266c-1.721.405-3.01 1.31-3.869 2.714-.859 1.405-1.112 3.561-.759 6.471l-14.515 1.576c-.736-5.3.165-9.918 2.705-13.853 2.539-3.936 7.201-6.702 13.987-8.3 5.283-1.244 9.808-1.145 13.574.296 5.112 1.942 8.253 5.398 9.423 10.365.485 2.061.383 4.181-.305 6.364s-2.464 5.069-5.328 8.658c-1.991 2.516-3.17 4.436-3.535 5.762-.367 1.325-.327 2.934.118 4.824zm-13.422 7.035 14.794-3.483 3.072 13.049-14.795 3.483z" fill="#ebebeb"/><path d="m135.753 110.788-9.585-2.914.291-.958c.496-1.631 1.083-2.899 1.763-3.804.679-.905 1.513-1.666 2.5-2.285.987-.618 3.081-1.598 6.281-2.94 1.7-.696 2.69-1.506 2.971-2.431s.227-1.727-.164-2.406-1.141-1.188-2.251-1.525c-1.194-.363-2.302-.268-3.324.284-1.022.553-1.942 1.779-2.759 3.681l-9.419-4.187c1.43-3.496 3.618-5.996 6.565-7.497 2.946-1.502 6.773-1.537 11.482-.105 3.666 1.115 6.393 2.78 8.181 4.995 2.432 2.999 3.123 6.222 2.075 9.669-.435 1.43-1.249 2.688-2.443 3.777-1.195 1.088-3.302 2.22-6.323 3.396-2.108.829-3.508 1.583-4.202 2.264-.694.678-1.24 1.674-1.639 2.986zm-10.688-.466 10.266 3.121-2.753 9.055-10.266-3.121z" fill="#ebebeb"/><ellipse cx="250" cy="416.238" fill="#f5f5f5" rx="193.889" ry="11.323"/><path d="m157.612 247.439-.921-.391c.827-1.954 1.303-3.575 1.454-4.955l.994.109c-.162 1.479-.662 3.191-1.527 5.237zm-.393-11.456c-1.94-4.263-5.547-6.951-10.431-7.774l.166-.986c5.226.881 9.09 3.768 11.175 8.347z" fill="#407bff"/><path d="m151.983 257.497-9.839 4.479-.448-.984c-.762-1.674-1.191-3.12-1.287-4.337s.036-2.428.393-3.633c.358-1.204 1.354-3.492 2.987-6.861.879-1.776 1.103-3.138.671-4.087s-1.049-1.559-1.849-1.831c-.801-.271-1.771-.148-2.91.371-1.226.558-2.055 1.425-2.488 2.602s-.303 2.826.393 4.948l-10.611 3.33c-1.337-3.851-1.348-7.435-.034-10.752 1.313-3.317 4.386-6.076 9.219-8.276 3.763-1.713 7.158-2.31 10.186-1.793 4.108.692 6.967 2.809 8.578 6.346.668 1.468.907 3.068.716 4.801s-1.089 4.153-2.696 7.26c-1.115 2.175-1.711 3.785-1.786 4.83-.076 1.045.192 2.24.805 3.587zm-8.984 7.247 10.537-4.797 4.231 9.294-10.537 4.797z" fill="#407bff"/><path d="m127.641 279.732-5.005 6.794-.679-.5c-1.156-.852-1.998-1.674-2.526-2.468s-.899-1.669-1.113-2.627c-.214-.957-.405-2.895-.571-5.814-.076-1.545-.441-2.559-1.097-3.042s-1.308-.665-1.957-.545-1.263.573-1.843 1.359c-.623.846-.859 1.753-.707 2.72s.868 2.042 2.149 3.224l-5.969 6.305c-2.375-2.117-3.746-4.557-4.111-7.318-.366-2.761.681-5.811 3.139-9.148 1.914-2.599 4.002-4.297 6.264-5.095 3.064-1.089 5.818-.734 8.261 1.066 1.014.747 1.784 1.747 2.314 3.001.529 1.254.836 3.246.922 5.975.067 1.907.273 3.231.618 3.972.343.742.981 1.456 1.911 2.141zm-3.371 8.357 5.361-7.277 6.419 4.728-5.361 7.277z" fill="#407bff"/><path d="m234.088 412.636c-1.623 0-3.19-.884-3.987-2.425-4.019-7.763-9.067-16.872-18.154-26.732-1.063-1.152-1.446-2.776-1.012-4.282 3.374-11.711 8.671-27.719 8.724-27.879.779-2.354 3.317-3.626 5.668-2.848 2.352.778 3.627 3.316 2.848 5.668-.049.148-4.611 13.938-7.923 25.156 8.352 9.473 13.501 18.458 17.816 26.794 1.139 2.199.279 4.906-1.921 6.045-.66.342-1.364.503-2.059.503z" fill="#407bff"/><path d="m241.56 416.238h-34.788l18.436-10.457 15.455.598z" fill="#263238"/><ellipse cx="230.795" cy="350.336" fill="#263238" rx="30.042" ry="24.896" transform="matrix(.9545 -.2983 .2983 .9545 -94.0061 84.8068)"/><path d="m151.653 333.981c-1.76.001-3.431-1.042-4.146-2.77-.948-2.289.139-4.913 2.427-5.861 2.605-1.079 2.968-3.743 2.97-3.77.188-2.005 1.689-3.639 3.67-3.995 1.069-.193 2.102-.495 3.297-.845 6.078-1.775 13.604-3.977 37.309 2.662 23.381-13.076 23.647-37.597 23.647-38.655-.001-2.472 1.998-4.485 4.47-4.494h.016c2.465 0 4.469 1.982 4.485 4.449.009 1.303-.137 32.083-30.042 47.499-1.019.525-2.198.643-3.3.322-22.595-6.525-28.957-4.666-34.068-3.172-.453.132-.912.267-1.38.396-1.107 2.847-3.411 6.138-7.641 7.891-.56.234-1.142.343-1.714.343z" fill="#263238"/><path d="m204.081 301.891c-8.506-33.825-31.184-121.061 41.467-126.394 65.178-4.785 83.067 81.97 87.415 112.026 2.534 17.517 3.386 33.404 3.534 45.819.191 16.015-11.06 29.825-26.755 33.013-35.511 7.212-69.116 8.238-91.749-.695-6.12-2.416-9.821-8.652-9.233-15.205.872-9.717.888-26.427-4.679-48.564z" fill="#407bff"/><path d="m332.96 287.52c-4.097-28.324-20.221-107.042-76.66-111.964-6.568-.573-13.049 2.66-16.074 8.517-2.518 4.876-2.437 10.791 1.335 16.636 12.439 19.291 42.104 85.961 37.624 122.291-2.04 16.53-12.407 29.728-3.385 48.31 10.89-.9 22.31-2.59 33.94-4.96 15.7-3.18 26.95-16.99 26.76-33.01-.15-12.41-1-28.3-3.54-45.82z" opacity=".1"/><path d="m323.239 333.79c-.245 0-.446-.197-.449-.443-.185-15.452-1.372-30.849-3.529-45.76-10.799-74.652-39.875-112.408-84.097-109.15-.241.029-.462-.167-.48-.414s.167-.463.415-.48c44.752-3.301 74.173 34.723 85.05 109.916 2.163 14.95 3.354 30.387 3.539 45.879.003.247-.196.45-.443.453-.002-.001-.004-.001-.006-.001z" fill="#263238"/><ellipse cx="315.124" cy="352.728" fill="#263238" rx="30.042" ry="24.896" transform="matrix(.9545 -.2983 .2983 .9545 -90.8803 110.0747)"/><path d="m325.295 412.636c-1.623 0-3.19-.884-3.987-2.425-4.018-7.763-9.067-16.871-18.154-26.732-1.062-1.153-1.445-2.776-1.011-4.282 3.374-11.711 8.671-27.719 8.724-27.879.779-2.353 3.313-3.632 5.668-2.848 2.352.778 3.627 3.316 2.848 5.668-.049.148-4.611 13.938-7.923 25.156 8.352 9.473 13.501 18.458 17.815 26.794 1.139 2.199.279 4.906-1.921 6.045-.66.342-1.364.503-2.059.503z" fill="#407bff"/><path d="m315.876 275.906c-1.614 0-3.173-.873-3.976-2.401-1.149-2.19-.31-4.896 1.875-6.051.865-.46 20.395-11.135 25.878-36.77-13.021-5.445-36.423-17.738-41.54-23.917-.496-.599-.827-1.315-.962-2.081-.12-.675-.961-5.979 1.001-11.002l-2.362-4.562c-1.139-2.2-.279-4.906 1.921-6.046 2.2-1.136 4.907-.279 6.046 1.921l3.398 6.563c.727 1.403.661 3.085-.172 4.428-1.073 1.73-1.206 4.262-1.119 5.912 5.763 5.206 29.04 17.543 40.427 21.77 1.998.741 3.198 2.786 2.872 4.892-5.072 32.767-30.14 46.271-31.205 46.829-.666.35-1.379.515-2.082.515z" fill="#263238"/><path d="m301.566 206.149c-.421 0-.846-.118-1.225-.365-1.037-.678-1.328-2.067-.65-3.104.155-.237 3.863-5.83 9.503-7.341 1.195-.323 2.427.39 2.747 1.586s-.39 2.426-1.586 2.746c-3.939 1.056-6.88 5.418-6.909 5.462-.431.658-1.148 1.016-1.88 1.016z" fill="#263238"/><path d="m332.768 416.238h-34.789l18.436-10.457 15.456.598z" fill="#263238"/><ellipse cx="258.008" cy="260.823" fill="#fff" rx="23.923" ry="21.531" transform="matrix(.9961 -.0882 .0882 .9961 -21.9882 23.7599)"/><path d="m258.498 261.115c1.81 6.351.446 12.306-3.045 13.301-3.492.995-7.789-3.347-9.599-9.698s-.446-12.306 3.045-13.301 7.79 3.347 9.599 9.698z" fill="#263238"/><path d="m230.795 264.86c15.102-1.944 45.005-10.466 49.939-13.905-3.888-11.363-21.959-21.082-38.128-15.608-14.574 4.935-11.811 29.513-11.811 29.513z" fill="#263238"/><path d="m233.734 272.16c18.742-3.562 43.114-9.543 50.084-13.375-.43 12.228-3.98 24.615-23.119 28.802-15.637 3.421-26.965-15.427-26.965-15.427z" fill="#263238"/><ellipse cx="208.012" cy="268.36" fill="#fff" rx="14.719" ry="18.626" transform="matrix(.834 -.5518 .5518 .834 -113.5489 159.3437)"/><path d="m208.337 268.68c1.137 5.357.155 9.826-2.193 9.982-2.349.155-5.175-4.061-6.313-9.419-1.137-5.357-.156-9.826 2.193-9.982 2.349-.155 5.176 4.061 6.313 9.419z" fill="#263238"/><path d="m189.748 266.628c10.132 1.196 30.25-.138 33.593-1.967-2.47-9.703-14.454-20.672-25.342-19.265-9.814 1.268-8.251 21.232-8.251 21.232z" fill="#263238"/><path d="m191.63 272.942c12.588.573 28.973.251 33.684-1.521-.43 9.606-2.951 18.772-15.812 18.622-10.508-.124-17.872-17.101-17.872-17.101z" fill="#263238"/><path d="m264.088 229.3c-18.885 0-31.442-9.33-32.059-9.798-1.974-1.497-2.36-4.311-.864-6.285 1.495-1.969 4.301-2.357 6.273-.871.217.159 15.133 11.036 35.838 7.111 2.436-.457 4.782 1.139 5.243 3.571.461 2.435-1.138 4.781-3.571 5.243-3.803.722-7.437 1.029-10.86 1.029z" fill="#263238"/><path d="m183.878 221.566c-.504.001-1.016-.085-1.517-.265-2.331-.838-3.542-3.407-2.705-5.738 2.378-6.619 6.321-10.917 11.72-12.774 9.787-3.371 20.327 3.183 20.771 3.464 2.095 1.323 2.72 4.094 1.397 6.188-1.321 2.089-4.083 2.718-6.176 1.404-2.042-1.271-8.374-4.205-13.1-2.564-2.723.946-4.741 3.34-6.169 7.314-.657 1.832-2.382 2.971-4.221 2.971z" fill="#263238"/><path d="m219.231 297.246c-.124 0-.249-.017-.374-.054-.707-.206-1.119-.933-.921-1.643.034-.122.877-3.027 4.562-4.929 5.146-2.653 12.988-2.104 23.309 1.632.699.253 1.061 1.025.807 1.724-.253.7-1.025 1.063-1.723.808-11.834-4.287-17.977-3.36-21.048-1.827-2.681 1.338-3.294 3.249-3.318 3.33-.179.58-.715.959-1.294.959z" fill="#263238"/><path d="m176.882 292.32c-26.101 2.344-44.786 13.151-44.786 13.151 7.729-1.46 35.355 32.727 42.458 59.094 13.102-4.859 28.382-8.167 44.678-10.751-9.87-27.177-27.919-57.962-42.35-61.494z" fill="#407bff"/><path d="m176.882 292.32c-26.101 2.344-44.786 13.151-44.786 13.151 7.729-1.46 35.355 32.727 42.458 59.094 13.102-4.859 28.382-8.167 44.678-10.751-9.87-27.177-27.919-57.962-42.35-61.494z" fill="#fff" opacity=".6"/><path d="m176.882 292.32c-17.08-1.928-44.811 12.372-44.811 12.372-4.913 3.133-3.58 9.011-.899 11.49 2.572-3.691 31.233-13.294 42.007-14.582-5.362-4.96-.381-8.557 3.703-9.28z" fill="#407bff"/><path d="m176.882 292.32c-17.08-1.928-44.811 12.372-44.811 12.372-4.913 3.133-3.58 9.011-.899 11.49 2.572-3.691 31.233-13.294 42.007-14.582-5.362-4.96-.381-8.557 3.703-9.28z" fill="#fff" opacity=".2"/><path d="m151.656 333.981c-1.465 0-2.9-.717-3.761-2.035-3.253-4.984-1.221-12.59-.781-14.063.709-2.374 3.207-3.723 5.582-3.014 2.371.708 3.72 3.202 3.016 5.573-.733 2.51-.882 5.717-.305 6.602 1.354 2.074.77 4.854-1.305 6.208-.756.493-1.606.729-2.446.729z" fill="#263238"/><path d="m136.325 137.943h-15.135v-6.833l15.135-17.989h7.241v18.377h3.753v6.445h-3.753v5.589h-7.241zm0-6.445v-9.41l-7.997 9.41z" fill="#407bff"/><path d="m149.909 128.459c0-5.684 1.023-9.661 3.07-11.932 2.046-2.271 5.164-3.406 9.352-3.406 2.012 0 3.665.248 4.956.744 1.292.496 2.346 1.143 3.162 1.938.816.796 1.458 1.632 1.927 2.509s.847 1.9 1.132 3.07c.557 2.229.836 4.555.836 6.976 0 5.425-.918 9.395-2.753 11.911-1.836 2.516-4.997 3.773-9.484 3.773-2.516 0-4.548-.401-6.099-1.203-1.55-.803-2.822-1.979-3.814-3.528-.721-1.102-1.282-2.607-1.683-4.518-.402-1.911-.602-4.023-.602-6.334zm8.24.021c0 3.808.336 6.408 1.01 7.802.673 1.394 1.648 2.091 2.927 2.091.843 0 1.574-.296 2.193-.888.618-.591 1.074-1.526 1.366-2.805.292-1.277.438-3.27.438-5.976 0-3.971-.336-6.64-1.009-8.006s-1.683-2.05-3.029-2.05c-1.374 0-2.366.697-2.978 2.091-.611 1.394-.918 3.974-.918 7.741z" fill="#407bff"/><path d="m177.771 128.459c0-5.684 1.023-9.661 3.07-11.932 2.046-2.271 5.164-3.406 9.352-3.406 2.012 0 3.665.248 4.956.744 1.292.496 2.346 1.143 3.162 1.938.816.796 1.458 1.632 1.927 2.509s.847 1.9 1.132 3.07c.557 2.229.836 4.555.836 6.976 0 5.425-.918 9.395-2.753 11.911-1.836 2.516-4.997 3.773-9.484 3.773-2.516 0-4.548-.401-6.099-1.203-1.55-.803-2.822-1.979-3.814-3.528-.721-1.102-1.282-2.607-1.683-4.518-.402-1.911-.602-4.023-.602-6.334zm8.24.021c0 3.808.337 6.408 1.01 7.802s1.648 2.091 2.927 2.091c.843 0 1.574-.296 2.193-.888.618-.591 1.074-1.526 1.366-2.805.292-1.277.438-3.27.438-5.976 0-3.971-.336-6.64-1.009-8.006s-1.683-2.05-3.029-2.05c-1.373 0-2.366.697-2.977 2.091-.613 1.394-.919 3.974-.919 7.741z" fill="#407bff"/><g fill="#263238"><path d="m220.89 113.631h24.762v6.384h-15.502v4.753h14.379v6.099h-14.379v5.895h15.95v6.771h-25.21z"/><path d="m251.199 143.532v-29.901h15.4c2.855 0 5.038.244 6.547.734 1.509.489 2.726 1.397 3.651 2.723.924 1.326 1.387 2.94 1.387 4.844 0 1.659-.353 3.091-1.061 4.294s-1.681 2.18-2.918 2.927c-.789.477-1.871.87-3.245 1.184 1.1.367 1.902.735 2.405 1.102.34.245.833.77 1.478 1.572.646.804 1.077 1.423 1.294 1.858l4.474 8.664h-10.44l-4.939-9.138c-.625-1.183-1.183-1.951-1.672-2.305-.667-.462-1.421-.693-2.264-.693h-.816v12.136h-9.281zm9.28-17.786h3.896c.421 0 1.237-.136 2.448-.408.612-.122 1.112-.435 1.499-.938.388-.503.581-1.081.581-1.734 0-.965-.306-1.706-.918-2.223s-1.761-.775-3.447-.775h-4.059z"/><path d="m283.69 143.532v-29.901h15.4c2.855 0 5.038.244 6.547.734 1.509.489 2.726 1.397 3.651 2.723.924 1.326 1.387 2.94 1.387 4.844 0 1.659-.353 3.091-1.061 4.294s-1.681 2.18-2.918 2.927c-.789.477-1.871.87-3.245 1.184 1.1.367 1.902.735 2.405 1.102.34.245.833.77 1.478 1.572.645.804 1.077 1.423 1.294 1.858l4.474 8.664h-10.44l-4.939-9.138c-.625-1.183-1.183-1.951-1.672-2.305-.667-.462-1.421-.693-2.264-.693h-.816v12.136h-9.281zm9.281-17.786h3.896c.421 0 1.237-.136 2.448-.408.612-.122 1.112-.435 1.499-.938.388-.503.581-1.081.581-1.734 0-.965-.306-1.706-.918-2.223s-1.761-.775-3.447-.775h-4.059z"/><path d="m314.184 128.602c0-4.881 1.359-8.682 4.079-11.401 2.72-2.72 6.507-4.079 11.361-4.079 4.977 0 8.811 1.336 11.503 4.008s4.039 6.415 4.039 11.229c0 3.494-.588 6.36-1.764 8.597s-2.876 3.977-5.099 5.222c-2.223 1.244-4.994 1.866-8.312 1.866-3.372 0-6.163-.537-8.372-1.611-2.21-1.074-4.001-2.773-5.374-5.099-1.375-2.327-2.061-5.237-2.061-8.732zm9.239.041c0 3.019.561 5.188 1.683 6.507s2.648 1.979 4.579 1.979c1.985 0 3.521-.645 4.609-1.938 1.088-1.292 1.632-3.61 1.632-6.956 0-2.815-.568-4.871-1.703-6.17-1.135-1.298-2.675-1.947-4.62-1.947-1.863 0-3.359.659-4.487 1.979-1.129 1.317-1.693 3.5-1.693 6.546z"/><path d="m350.265 143.532v-29.901h15.4c2.855 0 5.038.244 6.547.734 1.509.489 2.726 1.397 3.651 2.723.924 1.326 1.387 2.94 1.387 4.844 0 1.659-.353 3.091-1.061 4.294s-1.681 2.18-2.918 2.927c-.789.477-1.871.87-3.245 1.184 1.1.367 1.902.735 2.405 1.102.34.245.833.77 1.478 1.572.646.804 1.077 1.423 1.294 1.858l4.474 8.664h-10.44l-4.939-9.138c-.625-1.183-1.183-1.951-1.672-2.305-.667-.462-1.421-.693-2.264-.693h-.816v12.136h-9.281zm9.281-17.786h3.896c.421 0 1.237-.136 2.448-.408.612-.122 1.112-.435 1.499-.938.388-.503.581-1.081.581-1.734 0-.965-.306-1.706-.918-2.223s-1.761-.775-3.447-.775h-4.059z"/><path d="m162.288 97.023v-22.283h8.36c1.702 0 3.068.226 4.096.677 1.028.45 1.834 1.145 2.417 2.082.582.938.874 1.918.874 2.941 0 .952-.259 1.85-.775 2.69-.517.841-1.297 1.52-2.341 2.036 1.348.396 2.384 1.069 3.108 2.022.725.952 1.087 2.077 1.087 3.374 0 1.044-.22 2.014-.661 2.911-.441.896-.986 1.588-1.634 2.074s-1.461.854-2.439 1.103c-.978.248-2.176.372-3.595.372h-8.497zm2.949-12.919h4.818c1.307 0 2.244-.086 2.812-.259.749-.223 1.314-.593 1.695-1.109.38-.517.57-1.165.57-1.945 0-.74-.177-1.391-.532-1.953-.354-.563-.861-.947-1.52-1.155s-1.789-.312-3.389-.312h-4.454zm0 10.29h5.548c.952 0 1.621-.035 2.006-.106.679-.121 1.247-.324 1.702-.607.456-.284.831-.697 1.125-1.239s.441-1.168.441-1.877c0-.831-.213-1.553-.639-2.166-.425-.613-1.016-1.044-1.77-1.292-.755-.248-1.842-.372-3.26-.372h-5.153z"/><path d="m193.357 95.032c-1.013.861-1.989 1.47-2.926 1.824-.938.354-1.943.532-3.017.532-1.773 0-3.137-.434-4.089-1.3-.953-.866-1.429-1.974-1.429-3.321 0-.791.18-1.513.54-2.166.359-.653.831-1.178 1.414-1.573.583-.396 1.239-.694 1.968-.896.537-.142 1.348-.279 2.432-.411 2.209-.263 3.835-.577 4.879-.942.01-.374.015-.612.015-.714 0-1.115-.258-1.9-.775-2.356-.699-.618-1.738-.927-3.116-.927-1.287 0-2.237.225-2.85.676s-1.067 1.249-1.361 2.395l-2.675-.365c.243-1.145.643-2.069 1.201-2.773.557-.704 1.363-1.247 2.416-1.627 1.054-.38 2.275-.569 3.664-.569 1.378 0 2.498.162 3.359.486s1.495.731 1.9 1.224c.405.491.689 1.112.851 1.861.091.467.137 1.308.137 2.523v3.649c0 2.543.058 4.152.175 4.825.116.675.347 1.32.691 1.938h-2.857c-.283-.569-.466-1.233-.547-1.993zm-.228-6.11c-.993.405-2.482.75-4.469 1.033-1.125.162-1.921.345-2.386.548-.466.202-.826.499-1.079.889-.253.391-.38.823-.38 1.3 0 .729.276 1.338.829 1.824.552.486 1.36.729 2.424.729 1.054 0 1.991-.23 2.812-.691s1.424-1.092 1.809-1.893c.293-.618.44-1.53.44-2.736z"/><path d="m210.609 97.023v-2.037c-1.024 1.602-2.528 2.402-4.515 2.402-1.287 0-2.47-.355-3.549-1.064-1.08-.709-1.915-1.7-2.508-2.972-.593-1.271-.889-2.733-.889-4.385 0-1.611.269-3.073.806-4.386.537-1.312 1.343-2.317 2.417-3.017 1.074-.699 2.274-1.049 3.602-1.049.973 0 1.839.205 2.599.615s1.378.945 1.855 1.604v-7.994h2.721v22.283zm-8.649-8.055c0 2.066.436 3.612 1.307 4.636.872 1.023 1.9 1.535 3.085 1.535 1.196 0 2.212-.489 3.048-1.467s1.254-2.47 1.254-4.477c0-2.209-.425-3.83-1.277-4.864-.851-1.033-1.9-1.55-3.146-1.55-1.216 0-2.232.496-3.047 1.489-.816.994-1.224 2.559-1.224 4.698z"/><path d="m226.494 97.023v-22.283h9.88c1.986 0 3.496.2 4.53.601 1.034.4 1.859 1.107 2.478 2.12.618 1.014.927 2.134.927 3.359 0 1.581-.512 2.913-1.535 3.997-1.024 1.085-2.604 1.773-4.743 2.067.78.375 1.373.745 1.778 1.11.861.79 1.677 1.778 2.447 2.964l3.876 6.064h-3.709l-2.949-4.636c-.862-1.338-1.571-2.361-2.128-3.07-.557-.71-1.056-1.206-1.497-1.49-.441-.283-.889-.48-1.345-.593-.335-.07-.881-.106-1.642-.106h-3.42v9.896zm2.948-12.449h6.338c1.348 0 2.402-.139 3.162-.418.76-.278 1.337-.724 1.733-1.337.395-.613.593-1.279.593-1.999 0-1.054-.383-1.92-1.147-2.6-.766-.679-1.974-1.018-3.626-1.018h-7.053z"/><path d="m259.63 91.825 2.827.35c-.446 1.651-1.272 2.934-2.478 3.846s-2.747 1.368-4.621 1.368c-2.361 0-4.233-.728-5.616-2.182s-2.075-3.493-2.075-6.118c0-2.716.699-4.823 2.098-6.323 1.398-1.499 3.212-2.249 5.441-2.249 2.158 0 3.921.734 5.29 2.204 1.368 1.469 2.052 3.536 2.052 6.201 0 .162-.005.405-.016.729h-12.038c.101 1.773.603 3.131 1.505 4.073s2.026 1.414 3.374 1.414c1.004 0 1.859-.264 2.569-.79.71-.527 1.272-1.368 1.688-2.523zm-8.984-4.424h9.014c-.122-1.357-.466-2.376-1.034-3.055-.872-1.054-2.001-1.581-3.39-1.581-1.256 0-2.313.421-3.169 1.262-.856.842-1.329 1.966-1.421 3.374z"/><path d="m276.183 103.21v-7.904c-.425.599-1.021 1.095-1.786 1.49-.766.395-1.579.593-2.44.593-1.915 0-3.564-.766-4.947-2.296-1.383-1.529-2.075-3.627-2.075-6.293 0-1.621.281-3.075.844-4.362.563-1.286 1.378-2.262 2.447-2.926 1.069-.663 2.242-.995 3.519-.995 1.997 0 3.567.841 4.712 2.522v-2.158h2.462v22.329zm-8.436-14.304c0 2.078.435 3.636 1.307 4.675.872 1.038 1.915 1.558 3.131 1.558 1.165 0 2.168-.494 3.01-1.482.841-.987 1.262-2.49 1.262-4.507 0-2.147-.444-3.764-1.33-4.849-.887-1.084-1.928-1.626-3.124-1.626-1.186 0-2.191.504-3.017 1.513-.826 1.007-1.239 2.581-1.239 4.718z"/><path d="m293.785 97.023v-2.371c-1.257 1.824-2.964 2.736-5.123 2.736-.953 0-1.842-.183-2.668-.548-.826-.364-1.439-.823-1.839-1.375-.4-.553-.682-1.229-.844-2.029-.111-.537-.167-1.389-.167-2.554v-10.001h2.736v8.953c0 1.429.056 2.392.168 2.888.172.72.537 1.284 1.094 1.695.557.41 1.247.615 2.067.615s1.591-.21 2.31-.631c.72-.42 1.229-.993 1.528-1.718s.448-1.775.448-3.153v-8.649h2.736v16.143h-2.446z"/><path d="m311.569 91.825 2.827.35c-.446 1.651-1.272 2.934-2.478 3.846s-2.747 1.368-4.621 1.368c-2.361 0-4.233-.728-5.616-2.182s-2.075-3.493-2.075-6.118c0-2.716.699-4.823 2.098-6.323 1.398-1.499 3.212-2.249 5.441-2.249 2.158 0 3.921.734 5.29 2.204 1.368 1.469 2.052 3.536 2.052 6.201 0 .162-.005.405-.016.729h-12.038c.101 1.773.603 3.131 1.505 4.073s2.026 1.414 3.374 1.414c1.003 0 1.859-.264 2.569-.79.71-.527 1.272-1.368 1.688-2.523zm-8.984-4.424h9.014c-.122-1.357-.466-2.376-1.034-3.055-.872-1.054-2.001-1.581-3.39-1.581-1.256 0-2.313.421-3.169 1.262-.856.842-1.329 1.966-1.421 3.374z"/><path d="m316.737 92.205 2.706-.426c.152 1.085.575 1.915 1.27 2.493.694.577 1.664.866 2.911.866 1.256 0 2.189-.256 2.797-.768s.912-1.112.912-1.801c0-.618-.269-1.104-.805-1.46-.375-.243-1.308-.552-2.797-.927-2.006-.507-3.397-.945-4.172-1.315-.775-.369-1.363-.881-1.763-1.535-.4-.653-.601-1.375-.601-2.166 0-.719.164-1.385.494-1.998.329-.613.777-1.122 1.345-1.528.425-.313 1.005-.579 1.74-.798.735-.218 1.522-.326 2.364-.326 1.267 0 2.379.182 3.336.547.958.365 1.664.858 2.12 1.482.456.623.77 1.456.942 2.5l-2.675.364c-.122-.83-.474-1.479-1.056-1.945-.583-.466-1.406-.699-2.47-.699-1.256 0-2.153.208-2.69.623-.537.416-.805.902-.805 1.46 0 .354.111.674.334.957.223.294.573.537 1.049.729.274.102 1.08.335 2.417.699 1.936.517 3.286.94 4.051 1.27.765.329 1.365.809 1.801 1.437s.653 1.408.653 2.341c0 .912-.266 1.771-.798 2.576-.532.806-1.299 1.429-2.303 1.869-1.003.441-2.138.662-3.405.662-2.098 0-3.696-.436-4.795-1.308-1.101-.87-1.803-2.162-2.107-3.875z"/><path d="m339.37 94.576.396 2.417c-.771.162-1.459.243-2.067.243-.993 0-1.763-.157-2.311-.472-.547-.313-.932-.727-1.155-1.238-.223-.512-.335-1.589-.335-3.23v-9.287h-2.006v-2.128h2.006v-3.997l2.721-1.642v5.639h2.751v2.128h-2.751v9.439c0 .78.048 1.282.145 1.505.096.223.253.4.471.532s.529.197.935.197c.303.001.703-.035 1.2-.106z"/></g></svg>''';
}

class ErrorScreen extends StatelessWidget {
  final bool materialAppWraper;
  final bool canPop;
  final String title;
  final String? subtitle;
  final String svgString;
  final IconData? centerIcon;
  const ErrorScreen({
    super.key,
    this.materialAppWraper = false,
    this.canPop = false,
    this.title = 'Something went wrong',
    this.subtitle = 'Sorry we couldn’t access the page.\nPlease try it again.',
    this.centerIcon,
    this.svgString = SvgPatten.defaultError,
  });

  @override
  Widget build(BuildContext context) {
    var scaffoldExist = (context.findAncestorWidgetOfExactType<Scaffold>() != null);
    var column = Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildSvg(context),
            kToolbarHeight.gap,
            buildTextContent(context),
          ],
        ),
      ),
    );
    if (scaffoldExist) return column;

    final scaffold = PopScope(
        canPop: canPop,
        child: Scaffold(
            appBar: AppBar(
              leading: canPop ? const BackButton() : null,
            ),
            body: column));
    return materialAppWraper
        ? MaterialApp(title: 'Error!', debugShowCheckedModeBanner: kDebugMode, home: scaffold)
        : scaffold;
  }

  Widget buildSvg(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final svgPicture = SvgPicture.string(svgString, width: width, fit: BoxFit.fitWidth);
    return centerIcon == null
        ? svgPicture
        : Stack(alignment: Alignment.center, children: [
            svgPicture,
            Icon(centerIcon, size: width * 0.2),
          ]);
  }

  Widget buildTextContent(BuildContext context) {
    final t0 = Text(title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center);
    return subtitle == null
        ? t0
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [t0, Text(subtitle!, textAlign: TextAlign.center)],
          );
  }
}
