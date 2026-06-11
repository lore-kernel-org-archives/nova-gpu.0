Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA23803D3
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160713; cv=fail; b=VDeCL67pgLhYLdP9y6i1tjS7bDmR/SgGuyLWODZMjtF5IIPLd5mP6bCckpXp7YJAFxGrrcmzChjFZ75IxSF329xWb49M72BSwWAsCwQe4EcgznLFsKEXUCQqmdFGhtrw49/cS9zUPddWFz5J8B3iqrxzs3HIE76iBeTBayAFVe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160713; c=relaxed/simple;
	bh=KaRedwYob7imV4Zs5qeFUGplhK5yE9Wz5uCUgrD+3Ws=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=kR12YhNZrDfgpanQfSCKjq6DWSzR6zJR+CfQVS/V2aXKYaYgXMfiEq4EdLxbFMIOZ7O9a6NbTKdS1VIhIKWM5W2Cv59TKhVzA4wpr5o+NxsOYm76UuevjDfDpQT+ifKNvfx+ifXfj16PrkcmvFkOLcPvYdp632M8AIdMCKYXkf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K9M6ObMt; arc=fail smtp.client-ip=40.107.200.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K9M6ObMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPfHpeG1hJJtRZcYDXbDNcH9k7umwzAYbX+aeTV6oD7gm/xEn6tMs7XOKHxGvjsbF0RZmRIh3e0mGBIH4mT74Z9SDibXKe0AEKhtUZMogp02890CwiP/pWFkzd8X0m9mXz0AhA1rK0Ut5SB6pcWUDKhR6+jkEF1NxYf3/wisYHRJppWggeOvl+a4bXu+BSOcggfO5tgPolnZ4I3fwT9/zML0Xcmdjmm8uWifYjlB4zOemMxi7FL8Gg0iQVRMd0SAWA2hHrueHwP/xoID1MO7ltHerS3hGzWi0VgVnN4bthBHOHvoYFtJbwRjzj49a44xvx84OGZ3XE5j8AsjB5nMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nlGa7IOlQLDr87xLdTnomohQLd2h9VPUuH0VqvH/wE=;
 b=fMdXGNxHbjZDwmFoTVOaFYpmfEZhSN+GObMlLfKI3fY8Ew3wtHU4udUUTW/MRgV6FVRypTX7SfA/z+uV9/ENsAyQB0IsX9g+pRqhDVnlof3LkpBtqQTnWpljt94lVhaT/OvKA1bB/THAUjcnaM5Eae5mS+NILn8h2GPIJFqGezd4famJgkOektwjAN79NtGjZ8sIXD45tRBbeOXgalYHR41hPGgHMyz753OQCjf6Q7fBDPm5kVILXEaLcOIK2YaFn9qjBtcCOfOUhgG5oe/sOnL3/sAcmbSvHlQWAEvmczFTx5wn0onsaaJfNtoGPLmqBQiRa5I39PrXj2hmk/+B0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nlGa7IOlQLDr87xLdTnomohQLd2h9VPUuH0VqvH/wE=;
 b=K9M6ObMtdO3vkQ2mXWJDEwt+XVSGDEFt1gKMCW1UJwYjs0rUcQA2mztny7unoZhvJS/d/X1ZI/3mhV4v+IlgsTe41GpEbXduvRUbWT8e/tWFkFx2QS4HAIltrh0x2/R5Wivg/wBJ+n53zpLyz7cot89guYTdWdI1ART5rsckJZsLzTwMlQC1io1ukUEwuxRLdqijyI04RIL4kY4RWdY7/qMuOEZmWyk+xjvdfXIhA0/Va3XUcJ2dr2VfG2IFlvY88mTr+7bVPgovUIbb4foU4w+M05uZCr7iXTcVZEj7pFCm4suBP+7k55A+prvveb+lX7ZR6qs72iHEAyKGNPBOGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 06:51:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 06:51:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 15:51:37 +0900
Message-Id: <DJ60RSEY0KDF.6DPM9OTEHPC9@nvidia.com>
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
 <DJ5Q9J19NVQO.15OGQVSCIKO06@kernel.org>
In-Reply-To: <DJ5Q9J19NVQO.15OGQVSCIKO06@kernel.org>
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 645a08b1-1a28-4c99-4a3b-08dec785e48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|18002099003|6133799003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/zr/EpKPJtAyIk/yebL22mBAcskpcSgl7h1j+XBA9J3CamzqrjZdiSZzXKRPIlJgaMpmcWXtbWXLnumt3coK5Qm7UB9pk4U1o1xtb6y3QFZnwSAhchFsJet7jksLZ9v6qWRRj4q6n1yG+X+lSRXne8v/PUkHePQBmAkVsp3CKAoaLUqJ1G5f7ELdI0LxZ6rDFbZwCbkBNomv0Fx736oT5HBgFLi5i0qisDmgsxiPDDQf5ggCXlgpchjV5ddOYgdNw0Mu5Sc+odytWLx4FVT3D4lHJiqe/9yaCm0hfjBccJ8eH5Irznj8xukUCvoLZRsQaF+okQxWcB23aNiXrf9bg8FM0G91IFU7RJyqzFDHBpg8DzFJmK1P+vK0eQnwEX3z8skElbX+8eDv4mmvVLcOIPdFAXo+bFL9vD83Dfs49IwIH8mCGfqFtJcUaV8FCIndKHYz9F7VKEARxMIWJrrftNSx7G4wLFZy0TltEoUvKpnIHUgbkgv417WcUjdCmX4axk2MDwAiFaOja/PkTr3BBOUy5/fbTSszgC6pBphf5KStI326wTC824wMdiOIDRmRacHoglnDxiF7I8VJVMvJ0f4PpCGZi9asNYiRTk/kbBTFEjX1Mm1qkCL7/FuDQhz5a7za/VQXKdEs6a0zrAFlOj7ZFrXhlf3uoYe/BK8pdl3/qaQeqIZLH3Tb7iTgmtur
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(18002099003)(6133799003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlhHM1U4Y3hobzZPcFp6cGczSkpocjFlME0vdXBWMXpTNXdFcnVKM1VVVFhN?=
 =?utf-8?B?SWFuWmlVeU5IWGdTN2NzVDFLcUhmdllSZFhtYkNYZ1I4ZERiQzZuSngyaGdh?=
 =?utf-8?B?NXI0OFNIcysxTUR0ZkdJZWFmS0JEV29WcXg4ZkRvNzJXL1FqZXQ5T29ab21U?=
 =?utf-8?B?MG9nUW16U2lBcG4rVGhrQ2RNd2Y1aVZ4VzFXV0FGL05Bb0ZPdmVmRjFHVy9p?=
 =?utf-8?B?dWFRZTFmODhwM1VMQ1BvMnBqVUJ3NFlDdVd1amdydEM2ZUY0bkExb09ZNWpt?=
 =?utf-8?B?bjFQZjFIU0NOcEFIS3lkeVJEeUgrK2VaL3phZTRxV2FhSXFaM1JvZXFoVWdy?=
 =?utf-8?B?dnEzVWxUZ3JyRzcrSDVsN3IyRUNCbi9wa0lwdkRhWFZDYmhKd0kvcHhFQkFP?=
 =?utf-8?B?YXNiUDJkTXRTbHNDTkgxQ1NabmpPSFhSN1N6ZE81VG9OeEtpRGdvSTFmb0hz?=
 =?utf-8?B?aWZYMzlSQ0lsSzNLbVpPZjJjdlk2Z0VzT25LbU1jMEMxSElJU2Z2NGlvejJo?=
 =?utf-8?B?VWdnVEpBdFl4L3NybGw5dndQekZaM2ZNdEMxRnlRZW1hUEVPZkEwZ255Zktl?=
 =?utf-8?B?dm9sck11Q1p4ejYyeGF3VE5lNlB5U1AzcnBNQTN1aUlTZ2VFTW1iK1lBLzRR?=
 =?utf-8?B?US9hWFlTdVBpMGplVDJabWV4OVB2bGY0d1lnTnlqbnBjWnBsUXhmRnl5K2Rv?=
 =?utf-8?B?bWN2VFV1UTJJVVN2ZnExZDJ5dGtQYy8xdEFBaW1tcStIYnFKeGRHTVBzUkx1?=
 =?utf-8?B?b3g0OHFuUkNMbzQ4V0RFa3N4dUF6NVFZamFoSDNPTDQvTnZ0N1ZXYk5qY2hL?=
 =?utf-8?B?RmMzSE1OekQwbTZTcEZBRkxDcXVNYm5FMzY2MW1YdzJJbXU3QUFLQTlWTzZ1?=
 =?utf-8?B?NFFQZVBrSnVxL0dSSXJjNzlPdW4wdXhNSVd0N1d3d3g0QVpHN1JuVFRKakVX?=
 =?utf-8?B?VFk2czhWa2NrVllUZXFYMzdMa3FvTG1NSGY2U2x1WFNKUWVWbWQzMityN1B1?=
 =?utf-8?B?MEhPMWxETmNZYWw2MHBydGgwa1psbUtjUCtSemlhUzZiYnNPUzlRbFpQNndY?=
 =?utf-8?B?bDFnaWxTM0FWcGxaaHlqc0VCKzl4dHdhYjNybXdGeG5KdVV4c2ZwaHo1dzVT?=
 =?utf-8?B?aVFUcUxGNHgyZDhUaDdqMVNrZk1YcWQ3VjFwY28wczhmTTE2TnFTaTBDbXZC?=
 =?utf-8?B?TWd5QlpRaThhSk1zSC9kTHBJV0czcjM0Q3dtYzhhdTliQ0Rwc0EvQkNSY3Zs?=
 =?utf-8?B?QWc4NUF5eS9LdjlsVUdKZUR5eTZDeFM4Um9iUjUrWEFXUy9ibTRmSzZiMWpF?=
 =?utf-8?B?cXdZZVFTM3pScEZaQnZtOE1jUWt3SEFrWTRaRkduQVpFRVNvTW5kSjZBc08y?=
 =?utf-8?B?RlorNEZqNFl3ZS9UdVFDK05tb2xyOU5qYUVSS2NrNHFtNEJVWjFFMy9vSUcv?=
 =?utf-8?B?QkEyNWZ6UlNTdU9IZ2ZiWWRWWkhBMkU3Z21FbDZxbERZSkhmZG9iNlBWMUR0?=
 =?utf-8?B?Mm5HT2hHSXRaTFNXTzVnTHdIQnRNa2dZZEZZNWVveUJzR1lXVHQ0RTd2eHJK?=
 =?utf-8?B?b1pFR0t2UXdZRlBTT0lHOWdmN0JlZzZkUklySXp5V2tNWVA2cCtYR2djUjZB?=
 =?utf-8?B?cE9wUkpWOFd4UlE5MHJodGF3VDdSOEFNWHZFVnNqUFViZHhNckV0cG0xSE9Y?=
 =?utf-8?B?YW9HZWk2Y2V4ZTZiNTJ4ZzVZaGhEd2R0OWNUbWc0SFp5NFB3N1U4cjVEUWta?=
 =?utf-8?B?NDFCYUdBNU9FY0l0NDhqUVlLZUxqMFdiVmpzMEwzVk1wc3c2N2NsZGUxSzZ2?=
 =?utf-8?B?L0dFYWtqWnhTODVtaHJwUVJhZyt1WXgwQ0FNY0w1T1Y0cFNxWVV3NlRWRW9u?=
 =?utf-8?B?bWdPazg1cGlWVTNocCtrdDZiUy9oZGlwRFNieE9ybFRsUk5vb0ZPb3ova2lK?=
 =?utf-8?B?QkhtNzkvRXRJNHVMWU5mZDBndllwVkpwcCs2cjdJK01XdS9TdVM4THM3d1BH?=
 =?utf-8?B?UllOc21JTGxkNDVZdldOU0YxWVJXWW9UYzNQY2wyK3EvdWlMd0FMWUFIVVBU?=
 =?utf-8?B?TE0rY1lnZ3hwb0JVZHJkNU85dlRKS3pVeCtKN3EyQmpNdUViUk1KemJGaG9R?=
 =?utf-8?B?SXVGVUx2UlovWEdKajlBa3ZhNXBEaHRZL1E3MktySC85b1VZdFN4MTl2bUww?=
 =?utf-8?B?eDN2OUNGMW1MQ3QvVlVHZHQ2N0VqWWZ2T2s1eThiN2d2dEJmME8vR29kNVdj?=
 =?utf-8?B?bVBtRDcwYXh6bG85azhpcExESHhDRlVPT0VYd285L1lNRUxBMGRkZ1FmWkRw?=
 =?utf-8?B?RmJjblZrQlV1Y0NKQkN1bFRVeTVmTm8rTmZ6dVljenpucHdoUEd3RUNLQjNw?=
 =?utf-8?Q?TpGl3ozlY4ixzbzWY2ugn4ZROknsZIwyMyOBhW5BcmXhV?=
X-MS-Exchange-AntiSpam-MessageData-1: 1W+kwGGrMfs3dQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645a08b1-1a28-4c99-4a3b-08dec785e48f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 06:51:41.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lT8oTt6wAk0H9KKzEr3PFimWH91en+TQon4ZY3zOLdebR/fVwy9ZQy/8H6FMLe0UrrRo3xDax90R6M8Skmpneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444

On Thu Jun 11, 2026 at 7:37 AM JST, Danilo Krummrich wrote:
<...>
>> +pub(crate) struct TlvBlock<'a> {
>> +    pub(crate) tag: &'a str,
>> +    pub(crate) value: &'a [u8],
>> +}
>> +
>> +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload =
length (bytes, excluding
>> +/// padding to a 4-byte boundary).
>> +struct TlvBlockHeader<'a> {
>> +    tag: &'a str,
>> +    length: usize,
>> +}
>> +
>> +impl<'a> TlvBlockHeader<'a> {
>> +    const SIZE: usize =3D size_of::<[u8; 4]>() + size_of::<u32>();
>> +
>> +    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass=
 a longer slice).
>> +    fn parse(hdr: &'a [u8]) -> Option<Self> {
>> +        let hdr =3D hdr.get(..Self::SIZE)?;
>> +        let tag_bytes =3D hdr.get(..4)?;
>> +        let tag =3D core::str::from_utf8(tag_bytes).ok()?;
>> +        if !tag.is_ascii() {
>> +            return None;
>> +        }
>> +        let len_arr =3D <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok=
()?;
>> +        let length =3D u32::from_le_bytes(len_arr) as usize;
>
> Here and in a couple other cases, nova-core depends on !CPU_BIG_ENDIAN, s=
o that
> shouldn't be necessary.
>
> I'm not concerned to keep it for documentation purposes, but it may be a =
bit
> inconsistent with the rest of the driver.

While relying in the little endianness is useful for things like using
`FromBytes` on data structures, I think it still makes sense to handle
it in cases like this one where it is easy to do so.

Code moves, and in the (remote :)) chance that TLV takes off and other
drivers want to pick it up, this is one less fix to pick.
