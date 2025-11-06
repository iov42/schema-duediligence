namespace GeoJSON {

  /**
   * A Feature object represents a spatially bounded thing.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.2
   */
  @doc("A GeoJSON Feature object.")
  model Feature {
    /**
     * The type of the GeoJSON object.
     */
    @doc("The type of the GeoJSON object.")
    type: "Feature";

    /**
     * The geometry of the feature. Can be null.
     */
    @doc("The geometry of the feature. Can be null.")
    geometry: Geometry | null;

    /**
     * A feature's properties form a JSON object.
     */
    //@doc("A JSON object containing properties of the feature.")
    //properties: Record<unknown> | null;

    /**
     * An identifier for the feature.
     */
    @doc("An optional identifier for the feature.")
    id?: string;
  }

   /**
   * Union of all concrete geometry types. This is a discriminated union based on the `type` property.
   */
  @doc("A union of all possible GeoJSON geometry types.")
  union Geometry {
    Point,
    MultiPoint,
    Polygon,
    MultiPolygon,
    LineString,
    MultiLineString,
    GeometryCollection
  }

  /**
   * A GeoJSON object with type "GeometryCollection" is a geometry object which represents a collection of geometry objects.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.8
   */
  @doc("A collection of GeoJSON geometry objects.")
  model GeometryCollection {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry collection.")
    type: "GeometryCollection";

    /**
     * An array of Geometry objects.
     */
    @doc("An array of Geometry objects.")
    geometries: Geometry[];
  }

    @doc("A collection of GeoJSON Feature objects.")
  model FeatureCollection {
    /**
     * The type of the GeoJSON object.
     */
    @doc("The type of the GeoJSON object.")
    type: "FeatureCollection";

    /**
     * An array of Feature objects.
     */
    @doc("An array of Feature objects.")
    features: Feature[];
  }

  /**
   * A position is the fundamental geometry construct.
   * It's an array of numbers with two or more elements.
   * The first two elements are longitude and latitude.
   * An optional third element is altitude.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.1
   * "A 2D or 3D position: [longitude, latitude, ?altitude]"
   */
  alias Position = float64[];

  /**
   * A LinearRing is a closed LineString with four or more positions.
   * The first and last positions are equivalent.
   * @minItems(4)
   */
  alias LinearRing = Position[];


  /**
   * For type "LineString", the "coordinates" member is an array of two or more positions.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.4
   */
  @doc("GeoJSON LineString geometry.")
  model LineString {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "LineString";

    /**
     * An array of two or more positions.
     */
    @doc("An array of two or more positions.")
    @minItems(2)
    coordinates: Position[];
  }

  /**
   * For type "MultiLineString", the "coordinates" member is an array of LineString coordinate arrays.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.5
   */
  @doc("GeoJSON MultiLineString geometry.")
  model MultiLineString {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "MultiLineString";

    /**
     * An array of LineString coordinate arrays.
     */
    @doc("An array of LineString coordinate arrays.")
    coordinates: Position[][];
  }

  /**
   * For type "MultiPoint", the "coordinates" member is an array of positions.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.3
   */
  @doc("GeoJSON MultiPoint geometry.")
  model MultiPoint {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "MultiPoint";

    /**
     * An array of positions.
     */
    @doc("An array of positions.")
    coordinates: Position[];
  }

  /**
   * For type "MultiPolygon", the "coordinates" member is an array of Polygon coordinate arrays.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.7
   */
  @doc("GeoJSON MultiPolygon geometry.")
  model MultiPolygon {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "MultiPolygon";

    /**
     * An array of Polygon coordinate arrays.
     */
    @doc("An array of Polygon coordinate arrays.")
    coordinates: LinearRing[][];
  }

  /**
   * For type "Point", the "coordinates" member is a single position.
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.2
   */
  @doc("GeoJSON Point geometry.")
  model Point {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "Point";

    /**
     * A single position.
     */
    @doc("A single position.")
    coordinates: Position;
  }

  /**
   * For type "Polygon", the "coordinates" member is an array of linear ring coordinate arrays.
   * The first ring is the exterior ring, subsequent rings are interior rings (holes).
   *
   * @see https://tools.ietf.org/html/rfc7946#section-3.1.6
   */
  @doc("GeoJSON Polygon geometry.")
  model Polygon {
    /**
     * Identifies the type of GeoJSON object.
     */
    @doc("The type of the geometry.")
    type: "Polygon";

    /**
     * An array of linear ring coordinate arrays.
     */
    @doc("An array of linear ring coordinate arrays.")
    coordinates: LinearRing[];
  }
}

