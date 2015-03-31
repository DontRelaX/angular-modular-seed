var m = angular.module('angular-scalable-seed');

m.factory('path', function() {
    var createApi = function(path, def) {
        return {
            template: function (templateName) {
                templateName = templateName || def;
                path.push(templateName + '.html');
                return path.join('/');
            },
            image: function (imageName) {
                path.push('images', imageName);
                return path.join('/');
            }
        };
    };

    return function(moduleName) {
        var path = ['assets', moduleName];

        return angular.extend(createApi(path), {
            directive: function(directiveName) {
                path.push('directives', directiveName);
                return createApi(path, directiveName);
            },
            service: function(serviceName) {
                path.push('services', serviceName);
                return createApi(path, serviceName);
            },
            controller: function(controllerName) {
                path.push('controllers', controllerName);
                return createApi(path, controllerName);
            }
        });
    };
});