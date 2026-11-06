Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793947105;
	b=PX6GAY8Xs/V6RwIJac+K39FIdG9mpTg2CbBx/JMktO4vKBfhebfUFAY527FJnNVU2YBb
	 E8xi8ydZKlQyVFlLHMLh7xF66OAV8IVOG440wu2/Nro+ihC43JdeTrZVglHOgSFKeaB66
	 m23/PIGrxbL20lmIbkSrnoyYven1joRaDHonEoGbv9eq9SXfOgHTTom8CPVlrJhnwcc+s
	 vUnb3ubvR6fN1ZxnLZI7yExGTxjRLwExU9o1zn+6h13ldnCuE0vCztExt0YoAt/kCbzUv
	 hmjuYe+/uSXfm+qACzr//eyYo1Xa+U5iXn6cjacNdgb2FKGz02FovWTDMgg+pwQbOxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947105;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Content-Transfer-Encoding:References:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0jR1F7KAg8+jp7B24zhMxP4ZhKVtmMOKcP2H6tz6jjo=;
	b=m+1z3e/7o4D2m0Il0j2CkHZwl+RJWjlIjM99czWV+mTT0IS5Mo2qIM5L7k1ILCIG8kQC
	 NHR0oOTcIkrcQsX53kUpGPn7etDxDHPm8eS57zvcHngzMhBP0r1CQlB7jirGvGkScXdak
	 6KejcZV2jp24oS8v/73ZpzCe/udd1DInMPbG47KX1K4Jrk3kpwAapAE4XEH7FP5mdLacP
	 ZJcZs75HJPyCgsdhIr5npNVZkVM+nM1Sqpkc8qOjHFfaiVtrGlMox9Bnb9RuivkD41Psl
	 OBAIlqpHzXuIvty30snLrhIZrEe2G6RCsrScTlW77t56iQL/PjvW2W/WDrKNiS5ye2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AP4Cu9Yi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.17
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37EA606A337
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 06:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B37EA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AP4Cu9Yi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVli/NBDMP3j4xx5qSGjiffg5qRMUc+cNVV9YXYmrI0pEjqsNt/TSJoPu6k4BVFl7LD9H3+CXFqQmBClNUyq8fnyypAy3A88e9D+l+JryIZoiAmR+O/WBeeE0yt49coqYXZIpQlIc89FDOkXsg6q1Q/m8OpvKLR3UUOgyaJUTjOVNYzxJKJzSH9jn8qmxX2Hro/XNQkhJVtB+2AwgX9iUDwhS+vv+USq7rmXQYKfuWDS/BsZ4yfgQAuCeOsfPUOYEakrGLK9ypDBLSF2GUQwdqvGm8oHf5xWvn+9hDI6zSJSw1nn6M2AR6C6PmIHlTzaAUreu3vhtcw+UeILsNL+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jR1F7KAg8+jp7B24zhMxP4ZhKVtmMOKcP2H6tz6jjo=;
 b=X0CXIiXtiYW8Wz7+vlLAM0IUMW4YB7+qoielzPKKy+XRTQeMURJVHu5+WkgVRTHxemso9FAcAr0zb3bV1Ghuef0V0bBEk/mg2NTXXs8Bu1G9tyLybLGj5xXR+xjt2GCXx5Vgxp7eYbXeU3yg0uc2bHpNcXnwm3iNx+tUvzXEQ/rup8ZUGemtESIqb2Xz/RBPoVdn2Req7DaYZxJp1OkzS9bVtyBi2Qhrm0sYI2k9CjYPGGGwXUhwV62sTdyHZ0R9EIET+NcQ+53y7hbfq8UCFU9AxgRbvyRooHm6C3lnERjyaMT4UxmUygEcjiC4T3iD60P1qfWYPwYUeHvLgXhFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jR1F7KAg8+jp7B24zhMxP4ZhKVtmMOKcP2H6tz6jjo=;
 b=AP4Cu9YixOGS0ulifCWbJaJq5mlhWavPc9/NRV/w0v5Xg5Jd+WTSmayo4tNr4OVaLSkaznXoUhyYzil1nGud4qeu5rSSeQ7OxvIh+odcPw+hyQCHi2WUS6Z7WuNZXNHaLhs1nE4PRwg7i2iGa/mq6rN0uxL1VQOOEPQYll+b13VL+FGQnD3E/zcBNf9KYh0nL5gxC8XjZNjIZ3lOEPGPiPjH7ZqK2Dt8zmHJvurhqEJ583IzYpMH0/fJJQqHmEOfaCaaFsH2l7PYKjmEDuGSkRs8XrqvcjKbMIyZNWsfhp4sr38kTxLLrj/zZbwUkWY+wpc+erGmykAoSZqfCBRH2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH8PR12MB6793.namprd12.prod.outlook.com (2603:10b6:510:1c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 06:38:18 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 06:38:18 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 15:38:14 +0900
Message-Id: <DMNX661YLSXA.3DZ2LVCDVD3GT@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: cmdq: add the GMC receive path
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
 <DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com>
In-Reply-To: <DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:604:257::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH8PR12MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: f58604c7-ed5a-48ba-3ab3-08df3bd08aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|22082099003|18002099003|6133799003|3023799007|10067099003|5023799004|4143699003|56012099006|261026140227099003|11063799006|261026121527099003|261028144727099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|261021123027099003|261022105027099003|261021135927099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	gtZ98oc18PmrMcbv5hpUHDScLlaB5Geb142Cv8j9t/xYuGMboTOPpjGm8/HXRP6AZUAv2xUnp/ZdAN/4TiB8P+RoVqG1iU6yVc+Df/er7N6V3HBh6sXj/TYpTBufLpVjx/vGvgwob3Un2PktGQM4/LItuR+SKrSdaDrl6Iq2q897lqOeyRJqvEgXKNKf8yaCUdHRXKB1+6es4pg0If0qZT2WuT/KgnAm3ial2eDZiRoAsUqZxbYRlKqZAjBwWLdesCu56DSf/loJqTnxvMk+7fjbB8+S7Lq3Kb2ukszlccQUf+pMHbO7K4iFYLWBQhIULKMvirYJSwtI3jcb9vb63VhST88B/w7kG8B9DnM4EjSZp5HeLxNnLmZX6uC5UI0womna1Hi8AjQGaXsO+7GsQ0dwbz+92aompB0EhjXQtksClu6L5ardRYF3ahhxTkoNg2l5vGkeVbmEw8Y9XLgTdoGIUwP9NTelLPXlDF/SM48sEs4Sdtu1sylQjqANn/BuqEO/vbYzIzNfJaWNjH+2DJk7Ddr6jt2b4dQNd+BN7/e0szf7Kix9kIKzhQqNTojahEJ1V31sV+VHe4l43MiS2tNhVryjI9BEtl1b5qrcvNxcPs/wYzlOL9n2LqErpmpG02hSh7Vn1VfXP1QUTf4d4GyjVTynqI4wfkHiqEDQBNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(10067099003)(5023799004)(4143699003)(56012099006)(261026140227099003)(11063799006)(261026121527099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(261021123027099003)(261022105027099003)(261021135927099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXN0cWpKMGxMVEdSZTN6dHJiK045RmU4OW5IT2owQjdNaW5mN2RNdXlLeXVF?=
 =?utf-8?B?OTM3RERHVEEvWDhSYU8xNk5qRjNuVDl2ellsaXo1WEVsRFJ1QmtwWVhrYVg3?=
 =?utf-8?B?aVl4SEx0QjRqdUNSeG5wd3NUTWg2ZGRDRUpGZ2R6ZTNUVEl6MXlpR3RYV05l?=
 =?utf-8?B?c2hPek04ZzA3Z0NNU3ZaQ1lVS3VOS2FwY0FvclAyVkwvTElncit2bHIrU0tr?=
 =?utf-8?B?dzNiZ1NOK2lYbHZ1THNPUkpkU3lid2xaTU1RRTBSaHoyVEkzQ0YvUmVXUExE?=
 =?utf-8?B?ZW96dkhtelpEaDhGb2p5TVRjM1d3cmRLV0lnMDg0TzFKNW1OaDBabkFrVllY?=
 =?utf-8?B?NkRaUkQ3cE5xbndtajBTRWdWSUN6NGxoM0hLb2lsNUhpR3pZMTg5WnpRcmpu?=
 =?utf-8?B?bjVFVWMydkx1Rml5TDcvcGxTYXFyWnhLdHRQc1ZjL1FIOS8zNC9heEZtV0FY?=
 =?utf-8?B?VWZqc0Z5WEZzMVU4dkgzSDRoRnk1ZzBwWGlwRWo4ck5icWJvRUR1cnZuZVVH?=
 =?utf-8?B?dWlKSE9MbzFmOU5qM05zYTlob3BvRXFDYk9vZ1NGZ2ZIWUs0QUFMQmlHU0dK?=
 =?utf-8?B?Uyt1anluSmtOSm9VYkh6eVE2TERnMTNFYTBDeW9KOURQN2h3eTg0bVFvMVRn?=
 =?utf-8?B?VjVTMG1xU0J5VVZYa21wV3JrMG1McEgzdHJjcU44ZW5vYWoyR3d2WXVjVzhD?=
 =?utf-8?B?NjNEZ2gwbUJmYTRRaXR3VDdXZTdhNDJiUmNPWjBickFxV2lsSWFBZlhCdElM?=
 =?utf-8?B?MlZWY3pHZkc3eEpMTzJhQ09NYjRGYTJFcEhSOEx1V3J4a1dkVHV5Nnc3UHZG?=
 =?utf-8?B?ekdnVjZ3TWNUSFFmeGhTVWw0MmlPdzFxbytwRWYxcVRZWVl4MHA0N0V4Zllz?=
 =?utf-8?B?Z3hyTVdGd09IRFVNUzZDRi9IUW5hZDVQSTk2RkJtVjdtVzR5VlduV3I1amlV?=
 =?utf-8?B?bTVpbStud1BxSk5GWmw5VzNkQWJhQ3VCS2ZrQStkZmpYSWMyQnlHMGpMWjND?=
 =?utf-8?B?UXlZcXo2UDUyMDZpOTRxU3lycjVLMlRxMC9ISmgvc25ud0ltUmZ2b0JNcVM4?=
 =?utf-8?B?alNDeFZWQWdYdDlOcHhUQkFzMUk1Qmp5ZDY1OTNCV0czbGJhUHYxQ3ZDUTNR?=
 =?utf-8?B?bzQ3aFhhK1J4MjkxQTBnckdBbWorZkhJSjZjR3pYcmM4eEZxTFZ5R3lXS0th?=
 =?utf-8?B?QnU4WGFYaXFBbVBQT2hDYlhxaUw4THRtVWs3cjNQeDludG84WjR6YkwwUU5s?=
 =?utf-8?B?SlB0SG5keEtPUWo0ZGpTZkpBZXQ1MlNoNjlPQWE1Y1lDWjRoM3dHdm41Z3o3?=
 =?utf-8?B?Ui9qMkMxallNMjBtczFHODFQN0JmNjNEekpaa2NKSWcwdVNsYTBnU1FmU3lY?=
 =?utf-8?B?bWM3Wi9mK2M1a0cwSHZVYkRVL1dCWXVhaFVJZm4yZnZvQ1hjSUwyZVFEbW1l?=
 =?utf-8?B?RGJGS0hWd1JvcXk0Ui95bzhLWW83UEJwOGcraTlYQW16RUFIWFgwZW5IQjFr?=
 =?utf-8?B?eFVyR3FsREM4dmtNMGlTbFc1WGEwSUdSeHBiVVptY0J6bkN3T292cVhEUUhG?=
 =?utf-8?B?V0VQU1Nvdi9GamFuM21iZllBZlV6bmQ2NTUwWkozdlFxRjA0NkpVZjFQV2Uy?=
 =?utf-8?B?QWNvVTNvUHNXRGhmekJIQWRLNVdYazRab3ZnNkhYRzVwQWRxYU1JTk95TFBr?=
 =?utf-8?B?alpjT1JYaitIcGpGTGswd1JvSjZ6ZFhyT1dLZFJSbWFKZzg1VzFzNzdnV1lY?=
 =?utf-8?B?d2k4Y0xRNktlNG1iZDJUSFpnQlUzK2tRRFZvQWpjUW50WVllZFdBbTZqdW92?=
 =?utf-8?B?SERqQXJBMGlyOWFwY2Y5Mk5UdHZncFZkMmxJaHhnZ3U2NmNqNnFyZG9lNHlq?=
 =?utf-8?B?WTQ3RkJEWWZIY1RDSlhJSFFhdVZZMU8xQk1PeUVHY0pMSHNSWGxBZVB2Sk4z?=
 =?utf-8?B?Q0gwNXg5QUJKOHI5dWIrR1NCZ25aMzVqQ2puZkw2ZTZYRHJXeEJFRDRNaXJ6?=
 =?utf-8?B?eFJXSFRLS2tzUHZhbmVCcXYxY2QweTJaWllFWWF3QVJBK1B4cmdEaWZqa01B?=
 =?utf-8?B?aDFFYVI2bVI2azdsN0I2ZTJ0Z3FKSHFicDE3NzVwUTRPL1BmcXBXN1B5WDBU?=
 =?utf-8?B?KzdiK2lCUllYWDJERUdYQ2xVRzRkdlI1VXRrR0xXSlJ0M0Y1ejBsa3RwaCth?=
 =?utf-8?B?VEVtQnBobGxkb2EyVGd3U3ZEZ0o5R3VHOUJIOTlWOTJzVStkZWxQbko0OVlR?=
 =?utf-8?B?RkRSbkZZSG1FM3Zwbk1sdkpONzNhdC9tdHJRUnpWN3VId0V1dmVTZVVsVDBO?=
 =?utf-8?B?SEF6SWNHZ2VQRG5Nb1NRakNqWlI0MXV3QjN5YzVkNkZocm9tbkpZOEI0TXdN?=
 =?utf-8?Q?xtpthKq0vHBIU+WBlsLf+U9wRCGtC3wtdR0Fce6pkrhD5?=
X-MS-Exchange-AntiSpam-MessageData-1: URAXOmGRNDKO5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58604c7-ed5a-48ba-3ab3-08df3bd08aee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:38:18.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEuc6msUNd8OWkEgEc0CAfC4wHgOMoR+yzZsDUhLbk5uE4RT8mWmLatprvTnCSKM4cCiBiEJpBviUahTb9kNug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6793

On Thu Nov 5, 2026 at 6:23 PM JST, Eliot Courtney wrote:
<...>
>> index b035f30479a8..9adba5cbcd5c 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
>> @@ -29,7 +29,9 @@
>>  use super::{
>>      Cmdq,
>>      CmdqInner,
>> -    CommandElement, //
>> +    CommandElement,
>> +    GspMessage,
>> +    GspParsedMessage, //
>>  };
>> =20
>>  /// Trait implemented by types representing a GMC command to send to th=
e GSP.
>> @@ -150,7 +152,167 @@ fn write(&self, dev: &device::Device, seq: u32, ds=
t: &mut GspCommand<'_>) -> Res
>>      }
>>  }
>> =20
>> +/// Trait representing GMC messages received from the GSP.
>> +///
>> +/// These can be either replies to sent commands that expect a reply, o=
r an event not bound to any
>> +/// command.
>> +pub(crate) trait MessageFromGsp: Sized {
>> +    /// Id of the command this is the reply to.
>> +    const COMMAND: GmcCommandId;
>
> What about removing "COMMAND" here, and have `await_gmc_reply` take the
> CommandToGsp type, returning C::Reply (where C::Reply: MessageFromGsp)?
> That removes needing to define a bidirectional mapping which could
> become out of sync. Also, if this is going to be used for "an event not
> bound to any command" then it's better not to specify `COMMAND` imo.

Oh yes, that simplifies things quite a bit, thanks!

<...>
>> +impl<'a> GmcMessage<'a> {
>> +    /// Validate the GMC layer of `element` and returns its GMC API hea=
der and its contents trimmed
>> +    /// down to the GMC payload.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `EIO` if the element is shorter than the GMC API header, or t=
han the payload length
>> +    ///   advertised by the GMC API header.
>> +    pub(super) fn parse(dev: &device::Device, element: GspMessage<'a>) =
-> Result<GmcMessage<'a>> {
>> +        let GspMessage {
>> +            contents: (slice_1, slice_2),
>> +            ..
>> +        } =3D element;
>> +
>> +        // The GSP message header and the GMC API header together are g=
uaranteed to fit entirely
>> +        // into a single page, so it's ok to only look at `slice_1` her=
e.
>> +        let (gmc_header, slice_1) =3D GmcApiHeader::from_bytes_prefix(s=
lice_1).ok_or(EIO)?;
>> +        let payload_size =3D gmc_header.payload_size();
>> +
>> +        dev_dbg!(
>> +            dev,
>> +            "GSP GMC: receive: seq# {}, command=3D{:?}, length=3D0x{:x}=
\n",
>> +            gmc_header.sequence(),
>> +            gmc_header.command(),
>> +            payload_size,
>> +        );
>> +
>> +        // Check that the driver read area is large enough for the mess=
age.
>> +        if slice_1.len() + slice_2.len() < payload_size {
>> +            return Err(EIO);
>> +        }
>> +
>> +        // Cut the message slices down to the actual length of the mess=
age.
>> +        let (slice_1, slice_2) =3D if slice_1.len() > payload_size {
>> +            // PANIC: we checked above that `slice_1` is at least as lo=
ng as `payload_size`.
>> +            (slice_1.split_at(payload_size).0, &slice_2[0..0])
>> +        } else {
>> +            (
>> +                slice_1,
>> +                // PANIC: we checked above that `slice_1.len() + slice_=
2.len()` is at least as
>> +                // large as `payload_size`.
>> +                slice_2.split_at(payload_size - slice_1.len()).0,
>> +            )
>> +        };
>
> Consider sharing a helper for this (with the RPC code which does the same=
 thing).
> The split_at_checked also IMO simplifies the code.
>
> ```
> fn message_prefix<'a>(
>     (s1, s2): (&'a [u8], &'a [u8]),
>     len: usize,
> ) -> Option<(&'a [u8], &'a [u8])> {
>     match s1.split_at_checked(len) {
>         Some((p, _)) =3D> Some((p, &[])),
>         None =3D> s2.get(..len - s1.len()).map(|rest| (s1, rest)),
>     }
> }
> ```

Although the subtraction from the `None` branch can never underflow, it
would still need a justifying comment and I was wondering whether we
could remove it entirely. I came with this alternative version which I
like slightly better, let me know if you see a problem with it:

    // See if `slice_1` covers the whole message, take it entirely if it do=
esn't.
    let slice_1 =3D slice_1
        .split_at_checked(length)
        .map(|split| split.0)
        .unwrap_or(slice_1);
    // `slice_2` is the remainder of the message not covered by `slice_1`.
    let slice_2 =3D slice_2
        .get(..length.saturating_sub(slice_1.len()))
        .ok_or(EIO)?;

>
>> +
>> +        Ok(GmcMessage {
>> +            header: gmc_header,
>> +            contents: (slice_1, slice_2),
>> +        })
>> +    }
>> +
>> +    /// Returns the GMC API header of the message.
>> +    pub(crate) fn header(&self) -> &'a GmcApiHeader {
>> +        self.header
>> +    }
>> +
>> +    /// Returns the payload of the message.
>> +    ///
>> +    /// The second slice is empty unless the message loops over the mes=
sage queue.
>> +    pub(crate) fn payload(&self) -> (&'a [u8], &'a [u8]) {
>> +        self.contents
>> +    }
>> +
>> +    /// Returns the status code of this message if it is the reply to `=
command` sent with sequence
>> +    /// number `seq`, `None` otherwise.
>> +    fn is_reply_to(&self, command: GmcCommandId, seq: u32) -> Option<u3=
2> {
>> +        if matches!(self.header.command().id(), Ok(id) if id =3D=3D com=
mand)
>> +            && self.header.sequence() =3D=3D u64::from(seq)
>> +        {
>> +            self.header.status()
>> +        } else {
>> +            None
>> +        }
>> +    }
>
> What about calling this "reply_status" since it returns an optional
> reply status?

Done.

>
>> +
>> +    /// Logs an event, meaning a message that no caller was waiting for=
.
>> +    ///
>> +    /// A reply that nobody claimed (e.g. one that arrived after its re=
quest timed out) and an
>> +    /// unknown command id are logged at warning level. Other events ar=
e not logged.
>> +    pub(super) fn log(&self, dev: &device::Device) {
>> +        let command =3D self.header.command();
>> +        let seq =3D self.header.sequence();
>> +
>> +        match command.id() {
>> +            Ok(id) if command.is_response() =3D> {
>> +                dev_warn!(dev, "unclaimed GSP GMC reply to {:?} (seq {}=
)\n", id, seq);
>> +            }
>> +            // Nothing to do for the remaining known command ids.
>> +            Ok(_) =3D> {}
>> +            Err(_) =3D> {
>> +                dev_warn!(dev, "unknown GSP GMC command {:?} (seq {})\n=
", command, seq);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>  impl Cmdq<'_> {
>> +    /// Sends `command` to the GSP and waits for the reply.
>> +    ///
>> +    /// GMC events that arrive before the reply are passed to `on_event=
`, and RPC messages are
>> +    /// logged and consumed. The boot sequence relies on this to handle=
 the load-and-execute
>> +    /// events that GSP-RM raises before it answers `GSP_INIT`.
>> +    ///
>> +    /// The queue is locked for the entire send+receive cycle, includin=
g the calls to `on_event`,
>> +    /// to ensure that no other command can be interleaved. `on_event` =
must thus not use the queue.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `EMSGSIZE` if the command does not fit in a single command qu=
eue element.
>> +    /// - `ETIMEDOUT` if space does not become available to send the co=
mmand, or if the reply does
>> +    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, howe=
ver many events arrive
>> +    ///   while waiting.
>> +    /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>> +    ///   written to by its [`GmcCommand::init_variable_payload`] metho=
d, or if the reply carries
>
> [`GmcCommand::init_variable_payload`] =3D>
> [`CommandToGsp::init_variable_payload`]? Can you check the doclinks?

Fixed, thanks!

<...>
>> +    /// Receives the reply of type `R` to the command sent with sequenc=
e number `seq`, waiting up
>> +    /// to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
>> +    ///
>> +    /// Any GMC event that arrives first is passed to `on_event`, and a=
ny RPC message is logged.
>> +    /// Neither extends the deadline.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if the reply does not arrive before the deadline,=
 however many other messages
>> +    ///   arrive while waiting.
>> +    /// - `EIO` if a message fails framing or checksum validation, or i=
f the reply carries a status
>> +    ///   other than `NV_OK`.
>> +    ///
>> +    /// Error codes returned by [`MessageFromGsp::read`] and by `on_eve=
nt` are propagated as-is.
>> +    fn await_gmc_reply<R: MessageFromGsp>(
>> +        &mut self,
>> +        seq: u32,
>> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
>> +    ) -> Result<R>
>> +    where
>> +        // This allows all error types, including `Infallible`, to be u=
sed for `R::InitError`.
>> +        Error: From<R::InitError>,
>
> Currently, we have this flow:
> await_gmc_reply -> await_msg_with -> consume_element -> closure
>
> `consume_element` returns Result<R>. The outer Result is a transport
> level result. The inner R is a gmc/rpc level object, and it has the
> contract that ENOMSG means drain this element. In `await_gmc_reply` we
> provide the closure which is doing this gmc/rpc level job, and also
> asking the `MessageFromGsp` to decode itself plus getting the nvstatus.=20
>
> I think that `await_gmc_reply` should return Result<Result<R>> (and
> Result<Result<R, NvStatus>> in the future, or even Result<Result<R,
> NvStatus>, CmdqError>). For example, if we add an NvStatus enum and have
> it convertible to ernno, then later someone adds a conversion to ENOMSG,
> it could trigger this. And semantically, there is a difference between a
> successfully received reply that had a failed status vs a failed/borked
> reply. The RPC code also has this issue where it doesn't distinguish
> between a successfully received reply which conveys a failed status vs
> borked reply (actually, we don't even check the status for RPC, which
> isn't good).
>
> It's also worth considering adding a custom error type enum that has
> Drain or something instead of using ENOMSG - then we can encode drain in
> the type system and make it impossible for decoder/encoder
> implementations to affect cmdq control flow.
>
> Another reason to do this is that the later vGPU code [1]  (see
> `CeUtilsAllocError`) needs to distinguish this case - explicitly failed
> command vs transport failure.

Yeah, that's indeed a blind spot in the command queue design. Your
nested Result suggestion makes sense, so I'll introduce the idea as a
separate patch in the next revision.

>
> [1]: https://lore.kernel.org/all/6fbf38e3622a135c662443155513976898b1ab68=
.1790580105.git.zhiw@nvidia.com/
>
>
>> +    {
>> +        let dev =3D self.dev;
>> +
>> +        self.await_msg_with(|message| {
>> +            let gmc_message =3D match message {
>> +                GspParsedMessage::Gmc(gmc_message) =3D> gmc_message,
>> +                _ =3D> {
>> +                    message.log(dev);
>> +                    return Err(ENOMSG);
>> +                }
>> +            };
>> +
>> +            match gmc_message.is_reply_to(R::COMMAND, seq) {
>
> It's possible if we hit a timeout earlier, to get an old reply here
> (`is_response` is true but one or both of the sequence number or command
> id doesn't match). In that case IMO we should log and return Err(ENOMSG)
> rather than calling `on_event`, because it feels odd for `on_event` to
> receive things with `is_response` true.

Done. TBH I am still not super happy with the way we are handling events
actually, but would like to have a bit more visibility about how we will
use GMCAPI to change things more fundamentally. The current way is not
perfect for gets the job done for now.

>
>> +                // Message is not the reply to our command, log it.
>
> Comment says it'll log, but it only calls "on_event".
>
>> +                None =3D> {
>> +                    on_event(&gmc_message)?;
>
> It's probably worth a note that if `on_event` returns Err(ENOMSG) then
> it'll skip (drain) that event. So Ok(()) and Err(ENOMSG) are equivalent
> here, which is a bit odd.

Indeed. This behavior will be gone in the next revision.

>
>> +                    return Err(ENOMSG);
>> +                }
>> +                // Reply has an error status.
>> +                Some(status @ 1..) =3D> {
>
> Ok for now, but maybe a TODO to add the NvStatus enum? I sent a patch
> adding it before [2]. It will probably be more important to delineate
> the transport vs message vs content layer errors if we do this.

I am not quite sure what you want to me do here (probably because I lack
the context about NvStatus). Can you be more specific?
