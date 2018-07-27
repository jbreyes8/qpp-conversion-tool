package gov.cms.qpp.conversion.encode;

import gov.cms.qpp.conversion.Context;
import gov.cms.qpp.conversion.model.Encoder;
import gov.cms.qpp.conversion.model.Node;
import gov.cms.qpp.conversion.model.TemplateId;

/**
 * Encoder to serialize numerator data from a Numerator/Denominator Type Measure.
 */
@Encoder(TemplateId.PI_NUMERATOR)
public class AciProportionNumeratorEncoder extends QppOutputEncoder {

	private static final String ENCODE_LABEL = "numerator";

	public AciProportionNumeratorEncoder(Context context) {
		super(context);
	}

	/**
	 *  Encodes an ACI Numerator Measure into the QPP format
	 *
	 * @param wrapper Wrapper that will represent the ACI Numerator Measure
	 * @param node Node that represents the ACI Numerator Measure
	 * @throws EncodeException If an error occurs during encoding
	 */
	@Override
	protected void internalEncode(JsonWrapper wrapper, Node node) {

		Node aciNumeratorNode = node.findFirstNode(TemplateId.PI_AGGREGATE_COUNT);

		if (aciNumeratorNode != null) {
			JsonWrapper numerator = encodeChild(aciNumeratorNode);

			if (null != numerator.getInteger(VALUE)) {
				wrapper.putObject(ENCODE_LABEL, numerator.getInteger(VALUE));
				wrapper.mergeMetadata(numerator, ENCODE_LABEL);
			}
		}
	}

	private JsonWrapper encodeChild(Node numeratorValueNode) {
		JsonOutputEncoder numeratorValueEncoder = encoders.get(numeratorValueNode.getType());

		JsonWrapper jsonWrapper = new JsonWrapper();
		numeratorValueEncoder.encode(jsonWrapper, numeratorValueNode);

		return jsonWrapper;
	}
}
