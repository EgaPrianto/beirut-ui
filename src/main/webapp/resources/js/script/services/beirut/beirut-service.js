var beirutModuleService = angular.module('x.beirut-module.services', ['ngResource']);

beirutModuleService.factory('positionService', ['$resource', positionServiceFunc]);

beirutModuleService.factory('candidateService', ['$resource', candidateServiceFunc]);

function positionServiceFunc($resource) {
    var url = applicationBasePathLocation + '/api/:command';
    return $resource(url, {}, {
        getAllPositions: {
            method: 'GET',
            params : {command : 'get-all-position'},
            data: {
                page:'@page',
                size:'@size'
            }
        },
        getAllPositionsNotDeleted: {
            method: 'GET',
            params : {command : 'get-all-position-not-deleted'},
            data: {
                page:'@page',
                size:'@size'
            }
        },
        insertNewPosition: {
            method: 'POST',
            params: {command: 'insert-new-position'},
            data: {
                positionDTORequestString: '@positionDTORequestString',
                filename: '@filename',
                files: '@files'
            }
        },
        deletePosition: {
            method: 'POST',
            params: {command: 'delete-position'},
            data: {
                listId: '@listId'
            }
        },
        updatePositionsStatus: {
            method: 'POST',
            params: {command: 'update-positions-status'},
            data: {
                listStringRequest: '@listStringRequest'
            }
        },
        getPositionDetail: {
            method: 'GET',
            params: {command: 'get-position-detail'},
            data: {
                id:'@id'
            }
        },
        getPosition: {
            method: 'GET',
            params: {command: 'get-position'},
            data: {
                id:'@id'
            }
        },
        getPositionDescription: {
          method: 'GET',
          params: {command: 'get-position-description'},
          data: {
            id:'@id'
          }
        }
        // getAllLogisticProducts: {method: 'GET', params : {command : 'get-all-logistic-products'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
        // saveLogisticProducts: {method: 'POST', params : {command : 'save-logistic-product'}, data: {logisticProduct:'@logisticProduct'}},
        // getLogisticProductByCode: {method: 'GET', params: {command: 'get-logistic-product'}, data: {logisticProductCode:'@logisticProductCode'}},
        // deleteLogisticProduct: {method: 'POST', params: {command: 'delete-logistic-product'}, data: {id: '@id'}},
        // activateLogisticProduct: {method: 'POST', params: {command: 'activate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
        // deactivateLogisticProduct: {method: 'POST', params: {command: 'deactivate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
        // getAllLogisticUploadDataStatus: {method: 'GET', params: {command: 'get-all-logistic-upload-data-status'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
        // getCategoryByLogisticProductCode: {method: 'GET', params: {command: 'get-category-by-logistic-product-code'}, data: {logisticProductCode: '@logisticProductCode'}}
    });
}

function candidateServiceFunc($resource) {
    var url = applicationBasePathLocation + '/api/:command';
    return $resource(url, {}, {
        getAllCandidatePosition: {method: 'GET', params : {command : 'get-all-candidate-position'}, data: {query: '@query',page:'@page', size:'@size'}},
        getCandidatePositionDetail: {method: 'GET', params: {command: 'get-candidate-position-detail', data: {idCandidate: '@idCandidate', idPosition: '@idPosition'}}},
        updateCandidatesStatus: {
            method: 'POST',
            params: {command: 'update-candidates-status'},
            data: {
                arrayBind: '@arrayBind'
            }
        },
        // getAllLogisticProducts: {method: 'GET', params : {command : 'get-all-logistic-products'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
        // saveLogisticProducts: {method: 'POST', params : {command : 'save-logistic-product'}, data: {logisticProduct:'@logisticProduct'}},
        // getLogisticProductByCode: {method: 'GET', params: {command: 'get-logistic-product'}, data: {logisticProductCode:'@logisticProductCode'}},
        // deleteLogisticProduct: {method: 'POST', params: {command: 'delete-logistic-product'}, data: {id: '@id'}},
        // activateLogisticProduct: {method: 'POST', params: {command: 'activate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
        // deactivateLogisticProduct: {method: 'POST', params: {command: 'deactivate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
        // getAllLogisticUploadDataStatus: {method: 'GET', params: {command: 'get-all-logistic-upload-data-status'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
        // getCategoryByLogisticProductCode: {method: 'GET', params: {command: 'get-category-by-logistic-product-code'}, data: {logisticProductCode: '@logisticProductCode'}}
    });
}
