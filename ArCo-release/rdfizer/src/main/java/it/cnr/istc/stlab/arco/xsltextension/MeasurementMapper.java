package it.cnr.istc.stlab.arco.xsltextension;

import java.util.Map;

import com.google.common.collect.ImmutableMap;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class MeasurementMapper implements ExtensionFunction {
	
	private static MeasurementMapper instance;
	private Map<String, String> map; 
	
	private MeasurementMapper() {
		map = ImmutableMap.<String,String>builder()
				.put("altezza", "Height")
				.put("altezzaxlarghezzaxspessore", "HeightWidthThickness")
				.put("altezzaxlunghezzaxspessore","HeightWidthThickness")
				.put("altezzaxlunghezza", "HeightLenght")
				.put("altezzaxlunghezzaxlarghezza", "HeightLenghtWidth")
				.put("angolazione", "Angulation")
				.put("larghezzaxlunghezza", "WidthLenght")
				.put("raggio", "Radius")
				.put("area", "Area")
				.put("superficie","Area")
				.put("areacoperta", "CoveredArea")
				.put("capacità", "Capacity")
				.put("capacità di memoria", "StorageCapacity")
				.put("circonferenza", "Circumference")
				.put("diametro", "Diameter")
				.put("ingombro", "VolumetricDimensions")
				.put("larghezza", "Width")
				.put("lunghezza", "Lenght")
				.put("perimetro", "Perimeter")
				.put("peso", "Weight")
				.put("potenza", "Power")
				.put("profondità", "Depth")
				.put("spessore", "Thickness")
				.put("volume", "Volume")
				.build();
	}
	
	public static MeasurementMapper getInstance(){
		if(instance == null) instance = new MeasurementMapper();
		return instance;
	}
	 

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		String ret = map.get(arg);
		if(ret != null) return new XdmAtomicValue(ret);
		else return new XdmAtomicValue(new String());
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "map-measure");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}

}
