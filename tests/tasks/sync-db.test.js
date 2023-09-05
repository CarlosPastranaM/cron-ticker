const { syncDB } = require("../../tasks/sync-db")

describe('Pruebas en Sync-DB', () => { 
    test('It should execute the process twice', () => { 

        syncDB();
        const times = syncDB();
        expect(times).toBe(2);
     })
 })