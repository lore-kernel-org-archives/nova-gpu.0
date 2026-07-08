Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED298379C2A
	for <nova-gpu@lists.linux.dev>; Wed,  8 Jul 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517851; cv=fail; b=AaaLxb6+deKccP4khAUQ5ZJLSFn4VL95JXWy5raz0Zztsat5AJ/o3dRquKTZpW887fQL8ofobcvzaKSnIHrQshnA9uDP3Za2gSO5i0PqfHin4ZmJltKjqOVjB6SywVTIrXMGrwL1sW3M1CJKIFSXy5nwg3JdFixRf/cq6iz5H88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517851; c=relaxed/simple;
	bh=q7VYj9IrZAHzeeXFH9NOSUoysD4Yjml6qJ6XWPDSznE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OpTrk7dZwTv+tKzkRSFLFCjwPNRG82quCcAByuRAOxaIQQrCKd11Oz0vw+SfMuoU/54GIZZSYPXIRYiJcD2ZkXQ/eeSV2SmW4UYDjXynHo9mA8P4l0NMX3aN/elsizrVtMomwFRepBfNqZkURtpCkOVlMiAtWsMlSFu13XeJCjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LktJeYlR; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LktJeYlR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdrrmX8vfs2p5e30V3XIIeJ7xGpE6GPG9qD+9SpyqqKEGY6P5BucndHB7sxp1DigolJAhbniX1wyzqzsTI2GmQhsgGcoofdOCAmFppJbMVEbW5JH8jx8aGDGR/pxcJCxS1yrtw2Vi4kG0aAiQCb54Dx5MyAeAZwfIOYNzRCG5LdjnLg1ESwfX4GHTVE9ST2ZJcsMvmMTrF05gCE1Ef84qyS8J0GFl/HrUy4wIOpitTIKqgDF+apslkJVTf1z4onCavWjAVAIAelNVTbgTmxh1BIEHFGxxaZNqEr33FCqbxMOAkKXvbGWeG9uApOrO4snJ2KsNqi3MCSkgLcEGBOx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7VYj9IrZAHzeeXFH9NOSUoysD4Yjml6qJ6XWPDSznE=;
 b=kvds0P5fkJ/OEJ98lWwAiUZelRmYiM/OZB2tHxWSh37+oJ8vCmkGas3bgRHGmTxvpxiSw2yaIfzmXQsR7bnIeT5Jnmo2cAHBMYVHP63qa1mN0v1Tnm+Lh1wzqFNQ2DFjPB/wsljrDFZyUlybzakxXkLNqa80onjcfBYEGld/NPIKnd6rSQmgwHJdRDIK2AwS1kTJ0V2fkM3PSylc02W7rHyMSYv5vir6gl2L9SDsUWxFhgKtvLcFNh65rpd60kQfDdsfIdoU+l/uQKGPQo+LL0svGxVz5aZ4JEQRKfBwS++tzl45wU7ZUOZCo/WZTSOd4MranLp5atNvQtqgzrJNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7VYj9IrZAHzeeXFH9NOSUoysD4Yjml6qJ6XWPDSznE=;
 b=LktJeYlRiNVTWeNw2BvIKp6iobTfNiXZvTkdA6xKqUpKCFkMvO/CuIi+nQvjmtgKVMf9xKcMkEUB3oMYp/xe6oL427N3jfwv7y+Kabc1cNx65/o6zELdoNSNeTXxag5av8u157zjopINVuUZrLCRQ0A14u68i5Iw3q5OE5+IEOFGfHErHxfSU1amYPJxjYiVTvAaqcG4H7WfIcRa4ktPg+8BkNgRIqa+pMKeqNnQN2M0uMuFqNRZMfkEM+B3GvArQUl7Gcj1wm7i/NOKuFef4CL4Kah6X1N7vIFp6Is3oeVM4Lh/DdLHx/bH0R5qv4FG2AWAM6oArqngGDKzD0Xnaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9011.namprd12.prod.outlook.com (2603:10b6:208:488::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 13:37:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 13:37:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:37:22 +0900
Message-Id: <DJT8B5RGYECU.2I9GZH1KISOTZ@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH v3 3/8] gpu: nova-core: fsp: rename FSP response header
 type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260701062622.3499033-1-zhiw@nvidia.com>
 <20260701062622.3499033-4-zhiw@nvidia.com>
In-Reply-To: <20260701062622.3499033-4-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a07ef6-ea33-4a29-ffd7-08dedcf60c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|23010399003|376014|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5Ddc9mnqy8jEpbUbII0I+E2fKr7Q/hJ5St49oMjoJNEL4h5SCw3c48wHtenS6sKacIzi+OUGiwd5P8g0mBBQJuGPnnq5H7V/i4MmfTKphTDkZATzJGbJKsFJ6MeOsAkgUdocsV7hLAWxlgV0vRdi7aDv1U9xIw3/89xLgjiG2dcNx0KRmRS7dVw+tne22iM4AhR9DlyOyCyRIW+J4RKSmv7WKzkaEpIF8fNlYdPPcFU+KfFefH9iG5v3gGDs4NOMJHvlahPJaSz0BNyz7exTJFaGpOLKJrG3fj3zBYGQMq9ggNr+638byCOOmbhLEPU+qMcdw8KTMZrHNGZcgQZWJHHDz/xVBfSkgf1aqy+BYJJZlASETnjQD7KNucoyFakpHaZmFk/pbjHYUPLLXTqxdcGdcx9LqvW/ut/3Ww8YQtoxf79ISJ/fpWtv3W/Dd2s/oYpQoDf4sBTL1+G/DK51M7z8UUHotQmoGlEPE32C2dfy8tJUry3Y3jeGTlxf2ywHBUp+pNhioSd0/fajigxIdvwWiSBYDqF9vOHLsuT85DoyLT6efPun3N/X7SptL7410oeIhco1rf3U7aa4b9IUs4DMubuEjvW9ccvcP262I8yFc3XOZiy3S7L9XGmH+JWGGQaUtquZTTcwe4pQKvNCiQVA6qGkYvpJO3A4UT14mqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(23010399003)(376014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk4ybVphaGRsSlA0UVhJWHdCOTlWY0NMLzhWL1htN2lzWU1icWd3bnp6SU1m?=
 =?utf-8?B?WmNOL0VWN3JvbmM0V05hM1VpYUZkUkJKdFBxUWZibGU3TVlwTVpkR0hFU0tP?=
 =?utf-8?B?TlF3L1J4TVgrZ2RxN0RleVdObWJvWEhoWjlGbzVSZThyS3l1OVlpZHRZbzUr?=
 =?utf-8?B?YmJCTWlrZE04MU9wYlBlOTJvQkxvd0VvNVVFZkw4bU81UFlGVnplSjZnQVIr?=
 =?utf-8?B?dnVWNDg0ME1EZjJhbW10ZjdaRFVYZDdTcHMyS2RJaVlOU0hxT0lDWU9lZ01O?=
 =?utf-8?B?WE5GQUV0SlNzc3pzdlNjcVMzSU1OeXBYSmFuUW1VcSt1RWtwYUNFQWdyM3ZS?=
 =?utf-8?B?aWM3OWEyZlFrK0FDcjJOdkc3eDc4YkJGMWFyMW5nWTVpMkdYUW9rb240NmpJ?=
 =?utf-8?B?dXd4d3JEZURkbks2aEQvZnNkQ2pIYWhHVFhOTmRxQXZKOGJJV2NOSGhTd2RK?=
 =?utf-8?B?a0ZLT0dqRDZpT2lSMW14U0FWZkl0VHpaa3VZOW1UNitMQ1hvVHBUV2F2Y010?=
 =?utf-8?B?L3IrOTZ6K0NVVzA3THR4eDNma1pNVHM4a2lTQ3FGb3N5dDhiajJRSzZDMi93?=
 =?utf-8?B?Z2pCdGo1cWFXd1dvd2dtOXhGZXlURDQyMDUxdzV4RG1nY1BpTHh4Zk9yQkZ2?=
 =?utf-8?B?Tzg0ZjhITllNSFZVaDJDS2VhK0kwM0xDaHltTFN2Y3k1eHRoWjdrcDhNTTRJ?=
 =?utf-8?B?Y2JqM2Q0U1ZpUFd3RlZmMVpCTVArVThQRmI3ZkI2ZVRrM3JrS2pnWmJBSC8y?=
 =?utf-8?B?YUswUDhlQ2JVUFRDb0lrM3MwYkpRT1JHcUxseXZUL3NpWXNvU1VqczlGWk5B?=
 =?utf-8?B?ellMMVlESVgxQWNmTWxUazlSWkNhN2tuWE55KzhYQTg2NktIL3hSQmhsaE0y?=
 =?utf-8?B?T1JqaUZKSVpPMWFRZVBLcVNPWktoVDNyR1Q2cEJTdGwvTHpRZytkMk5NNjRE?=
 =?utf-8?B?YW1zazdxUnBkNTJNVmpXS1pFSmRKamd5Unl6RUtua010S3JSUHhNMUZsMW4z?=
 =?utf-8?B?MXFzVWlvOUw2dlJ2a1hWZy9pWnVFVkIxZ2dIQ2JqNmNMRzJJZjBqOSs2VHZB?=
 =?utf-8?B?SUhmT1RIK1RNd2J2bHVnZEJUNm1CaFZDRzh5b3BJTmdRWFlKUnZRZHdsUjBX?=
 =?utf-8?B?NDZQSE5QUk9SamhVMnJjVXgzM2hTQjBud2o1VHZpL2ZnakZFdk1ORzdhVzdk?=
 =?utf-8?B?RUZzZzNrVnF4U1B0ZEl6RGtGeWRxaWF5dUFrNXhsNUt2Mi9CM1F5OVdnZXZv?=
 =?utf-8?B?WDRaRmtCeHdEbStEZEhnSGZJOUU3K1IzL2hVNVNFUitNVXNidisvUXZ4Nk9j?=
 =?utf-8?B?MWxubTVqQnlvZzFXT3FBR09rcjRNWHpNLzJMUGVsZTdzVGxaVVl1OHo3S1JG?=
 =?utf-8?B?dUQvWnpKS0l1OWxwRTNhSitiY2hzQjRDQlNsWlYyMjlyOEU0dlEvcDBGa0xE?=
 =?utf-8?B?YWFFaGQ5c0lHelRiUjkvZzhZcUM4ZjZNMUVoeE13WWtuVUlKai9PakNjKzE1?=
 =?utf-8?B?MHVSek1CSGdPSnNGbmZtUDRiaUx1RHQ0OWl5ZmVJWTRiRy9hQW8yQUF4aE9r?=
 =?utf-8?B?dlN4VktPOGNhUm96Y1ViclplK2V5K1prVDFrN3VLeHVLdlRMWHJXNDZjdkRo?=
 =?utf-8?B?cnQwUlJ6Q2g0U3UrS1hBSkswOWNzalBxZjRrSE5yVzlHT1RTL1JBeUpuR2Qx?=
 =?utf-8?B?UDJwcFZzUUdRbnRoUTVwV0ZKZytSY1dpcmlWRUVTOE9uNlo4ZWJZa1kwWHhN?=
 =?utf-8?B?a2E5dnNyOC90NmJJRU5BNlREUHVvellRZ0RjRWtQcVFwZTZIaUR6cHFPNnhs?=
 =?utf-8?B?dDk3NFRCN1B5K05qYzZIbmtFQXdVTWtvZ1MvSTJCU0VJNHlDSzlwMzdOTnRS?=
 =?utf-8?B?VnZKVkQ3dFlFUS9rb1lhd3RpRlBYM2JMcFRiWEc2SnpRcnNEMnRHeEF3VTRt?=
 =?utf-8?B?eTFRTXg3alV1WTB2TkczWENkc3VLR3ZIMkNoOG03NHNpWXRBWU9UcG83QkdG?=
 =?utf-8?B?SlNOcnFPZGFXV2poRm54cC8vcFJ0dnpoR3ZUU2JoVFdWYTlPUnR4UStXb3Y0?=
 =?utf-8?B?K2VPcjJsOXAveXBxaTFObGpaOG95VW5WL3ZSS1FLWWhVc2FLU3ZKUG4rVHd2?=
 =?utf-8?B?bkYvSUQzQ1RRaTMrdGxURTRDUzhRd3ZacjVaSDhpeC9nVUZuSHkzdGhWSkJ6?=
 =?utf-8?B?azFhMElZV1c4Tm5IN2x3aEx6MDBlWG1OZ2p0SGl2UEN6TG1xZk9nTDd4bHZa?=
 =?utf-8?B?SUJCL0xQeTlRMmJNbTNBREZFcU43Y1lzYWtDcXJ2Y3lOWUJBQWYwUFhYaGtL?=
 =?utf-8?B?aXBDc1BaNE9UMmlQOEFWNkNOdGhNV21Ucy9GYnZnNStjazh6TEc0ems1akp2?=
 =?utf-8?Q?TT0wXNVN36TfZcRW7quafebxY3xPjpGlNOQnWatcf+sp3?=
X-MS-Exchange-AntiSpam-MessageData-1: wjTz2YjLJK2qzg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a07ef6-ea33-4a29-ffd7-08dedcf60c17
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:37:25.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj+tZ1PR5YqTND6IGOdsShmY0+55LrYHBRRFpowYVM4ANye0H+y2UQCMe0BI7Wr5qNGEugIG7NKkPdwS2bd7WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9011

On Wed Jul 1, 2026 at 3:26 PM JST, Zhi Wang wrote:
> FSP message handling currently uses FspResponse for the common response
> prefix containing the MCTP header, NVDM header and command response
> payload.
>
> That name is too broad once other FSP response formats reuse the same
> prefix and append protocol-specific payloads. Rename it to
> FspResponseHeader so subsequent response structures can embed the common
> header without overloading the meaning of FspResponse.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/all/DJMBI9CN2Z67.2T02SR8TAWEC5@nvidia.com/
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Pushed to drm-rust-next, thanks!
