CREATE PROCEDURE select_client(IN `_id` INT)
  BEGIN
/*

*/
	SELECT
        firstname,
        lastname,
        email,
        super_client,
        logo,
        logout_timer,
        last_login,
        
        street,
        street_nr,
        postcode,
        town,
        region,
        number,
        
        description_intern,
        description_extern
    FROM client
    LEFT JOIN address ON address_id = address.id
    WHERE client.id = _id;

END;
