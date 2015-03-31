var m = angular.module('main');

m.directive('wrapper', function(path, $timeout) {
    return {
        restrict: 'A',
        replace: true,
        templateUrl: path('main').directive('wrapper').template(),
        scope: {},
        link: function($scope, element, attrs) {
            $scope.timer = 0;
            function addToTimer() {
                $scope.timer++;
                $timeout(addToTimer, 1000);
            }

            $timeout(addToTimer, 1000);
        }
    };
});