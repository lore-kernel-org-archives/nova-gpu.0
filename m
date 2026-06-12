Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895433F59E
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280451; cv=fail; b=CcwKjeiBpzf7ZU84fDzPhqIybPWlHcOx5K1N9kXjZ8tOF2fDJSqqJs389AHwRU66/4cMMapKnQmVVNO0SiaPfKlbjA9kB4RDlehBY5Wt8X9K9NzEl8apUeMQ1qzfpCtY3JaGMYlXHfcsRlL+TEZPirrVdCzN/vpbu8dMSvoce+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280451; c=relaxed/simple;
	bh=8np4qMgQ3JTvs70cRYdxQTOHLZTw0A30fQwUiyWNpr0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=eU68g50CAv0HfYuBZDYOi525ibj3nN7Cm96fA4hteTZfvLzrezQKQ4IB3Zg3S5t9eaZ+xK1R1AtLtm0J/SFYAj3exvNIBCwyAkH9QlfVs/YSYTS9IIAchD57Dk1M3qZLQRB4/tLLGmEtRJfchy+uF7OUzOyYEDXpQ3PgJBGXHOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HEu5V9l4; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HEu5V9l4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTLPi4JFAcJn0MkbJ509ae8BoRjEH8C3jW1BWXtheRF3Ck86HhgiRs5KJrTw5YivT6tK8Ob6n0obmCFmEMiuPaq8fyPbC/354kvPcS+4sgqPO9QXEemZg5OUEsvGcGxsO5lSSHbGdk3zB2avoCuqpNco7vTwH/RQrkqQMWXDuFbYt4czqXL1veTnF0L//NKmmKwWpCIOURCiGa/IW2RnrzEl4j/gX2zS/onS7t+54XTV+Nw2Ccf9is3QBAq841VVr8aIG0BsOlKFNImELAAGNjDihoe5HxACEydCbQRYEQ2yjOYt4losat/p+T1DXFHNEfqwjc5E9ZFA+tGCA17jyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDSmHUu6rX41+GGpV73BZb7BDV6fMl+CB/oBVRNapi0=;
 b=PPnJkv5iSiQP+uRYIS8kKTRNqMhbHn3dFrjHCo1G72g2/B2x5lzZZcrDhzSpf7Ux+xTTx3W0n5UTfcpKmR0VUHSKxUNQVtTRizyUFgFlTfYr3azSL/eVkMHhDprz986i/WJBZvd3QAjicslfTIKeezGqYv81OhHG3cLUepAoKJbMPo9aRWcZHie9QX53/R1Hn0w/MOyExuG1ZHwXw92ovmhPYZcDviYfat6abiiIkfivnQXXx0gwTnElJCo8/ylsh/zK+wagnCGlmh1e9X4cVa4VP4s9vxe/4UU82r6Tgi6Hk+UiedepDf8bUJ7/MI/+BZoXtUhYlz0OjWODcCN0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDSmHUu6rX41+GGpV73BZb7BDV6fMl+CB/oBVRNapi0=;
 b=HEu5V9l4cQpvx4CfuK0VsR0TJ7752pUDDC9hwYXQOkrYrLoG4rZioUlMMOBSMUVeDIQ71kCIufdgU3lltWgrWMsDHoXsG/FWdKbbCMDPJBvtQCJ4gvijcTwj3vTKxKsbm4kYaAecwQHdTTxHYuvbuPa6DlSIM7ArGCUEJPrjlhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB9226.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:07:26 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 16:07:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 17:07:25 +0100
Message-Id: <DJ777VLZB7BG.1DY1X4UOS0MWJ@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
Cc: "Shashank Sharma" <shashanks@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "Zhi Wang"
 <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "Alistair Popple" <apopple@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260612040420.121499-1-jhubbard@nvidia.com>
 <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
 <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
In-Reply-To: <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
X-ClientProxiedBy: LO6P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::18) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: e483e14b-4eb2-4784-b718-08dec89cb1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|7416014|376014|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0m2Hv99n6y6n9sRTnDlSBpC6qMYM5IBDXq0gMaLrDNKCW5EUVwZVXEGhLQmlYqtM9p7y2Bqxl9xEtKho6uGJ+fq9pGxELM04Vz5NG/H+O1y2iwMas4MHx0A7bkR+rC8lcDq4LKtC1DGx3r25fPiUrVKTSG5w74qdM6vIfkPL8nCDkN0ZWm+XSxqPzRqyFOf4yy4Cu/v8aKVkKn8mulb7BBBk7oD5hQafNLeIWLeijqsemID39sr2EWzGniwVhniuC5Uzp5cMABc50cJaQqhB1Oj22cZa/vLcuYyl8GPSNkt/fSzLdVHgw3UUr0RBP0Kq9GPeU5hTV1TFdSxKy6eTjvhq+spVQtqAn7WfCVXJiDuOlz7NZLXuufF32yqsJ/LJMKpWZKOrdOAuUmQnB5f4CWRgEDtBQoU9g94641L2fFtJYO9O4lnXFJusRF6wwjp0kVJbZ8p78HVqMzWVvMdRNkSnjXANS1iZAAfiS9tsYHa6Ut1MKPqC+KxGg7rCDVoSvD3CYEHu0F2fEGrtrmdVtvpMyr2/QsIosKyG+MXNVO1hbr02DaGY2BAAQ7kiI3E4ilIhPx/6c1Momg3ks7jXIU1BJ8z3GBQNL59rp7SLkY4zjZPrHqFAWR4dgIRuL0yYCRXAFORsG0sQApMwtizx611NLd1uB2spp3W/L4f5VHVD+M51bg2Y+9rrlbfz6aPK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(7416014)(376014)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1ovd0Y2UFBCejVFdkxWSDdXc244Qi9iNUpjZkJwSDNDN0RETE9leWRXVHVN?=
 =?utf-8?B?Y2dDbXhweUYwbWNXRGJ0RG8yeUkzdXFBT25UQXlhMUx1UlIvT0NyVmFnNFdN?=
 =?utf-8?B?U0FMSnNzK1N4WlBsMEszbURsQ2NvbGltWkFYNHYralVLZWQ4SWhBd1EzekV0?=
 =?utf-8?B?eUJKalRyaC9vemxZMXoyd2lZK0NGb0JSZ0Z2MXJDdWRQcEhEL2xYQWgwNStD?=
 =?utf-8?B?ZlJySkVCSjRXbDFZQUNvQjVyY3p4Si80b0xsS2kwd3RlNGRoVGVjVmp4RFpZ?=
 =?utf-8?B?bEdHdTRnK3B6MEhzVW1Rb0VYYXc1bHgraEVKNUpERmhmakpTNnZrTEpUQjNV?=
 =?utf-8?B?cFMxMm1zOVlTMERpYVBIQ0I4b2tLeEc0RFdKNlRnU01YMjhaSFJ4dTVUdXBk?=
 =?utf-8?B?RitmMllVMnBkTEtHdG1VZ0Myd0d5N3dkQWxXU3VER0EzcnVuS0JXTFBISHBL?=
 =?utf-8?B?bkQrTkFXYlFNSGNEUHViUm9uYVZwaGtHbFZRNTl4QVZWWGZ4Mm5jZ3dZM2F4?=
 =?utf-8?B?cys2V1o3TTdtdEo4NTRpREw5YWxPaVRBUmVwMXBjV1lOQmM4SHJsbENBQ1Fy?=
 =?utf-8?B?bWtkTko5QThrdXVrTU52ZC9sQ3JMYzBGdTZzbTE4UHZabWdwQVFIY2NaSmdr?=
 =?utf-8?B?NktOa0xsVTgwUVJvcDVYaWF6bkJYZlFlbG4rQXVlSlYzdTR4c3lkbTNwYmdW?=
 =?utf-8?B?SWJBRFNiODJTVVpDcHRvSmRNVHR4Y0JYVlBOcUN2eDRZSCt5VWxvNkp6d0sr?=
 =?utf-8?B?WXRzRGJ5b2pHWklxVlhWd3hFVFBqWHduZm9UTlljU2NzbnpuQ2xLMXN1RHRl?=
 =?utf-8?B?bkZUUGNLc2FRb0ZaQUNuTytYazJwaktEanR1UFdidlJHd1pxaEZmSHc0bUow?=
 =?utf-8?B?WGZGcmZYajc3dEIvcnpJV3g2eVUxYW03eWVWbkRTNVNtUmdIYk5ST0NsNWlS?=
 =?utf-8?B?QnhMQ2cyZThJVUJ1SVdmSnFMOTZJdUtDQ3dBbmY2c3JqTjdlSWVpZGltRlln?=
 =?utf-8?B?dXFXQmlpaVBtWUxEQ1Aya3BPQVZGRzhjK005WVQ0a1k1RjYxYlVoRnVSRHNp?=
 =?utf-8?B?QVIxRDZnOFZlRG5ENE5WdmZVbi9CRVhaMUxscHU2aEUyV3VGb1lMMzVCZENE?=
 =?utf-8?B?UkhZbWt0d2YvR1VpVTJMdkZ3K2hoUTV2MzArdEQvdjJ1ckJGdkJlbVFGLzJk?=
 =?utf-8?B?WlpXRUFQY1U3YUdTbFJIWUl6Q0ZNazh3Q25PM2tkdk5nZFBMODNRSlV1cUdu?=
 =?utf-8?B?Zlc2Q0cxTkpBRVFvdndJckRlVVVVVW1XbmxEZ0sxSUFCZDNONXdUelhndVV1?=
 =?utf-8?B?ZjhYRzJiNWFRQ0xUUmROdDN0Rlh1eVhtNmdwNkc0Sk53ZDVlVEFnRFdkd2Fo?=
 =?utf-8?B?UlRTYVpIL0U0anZxaC9xOCt3L1J1bGVMaGZKMi85WlRTL1BoWVB3b2NHZkM1?=
 =?utf-8?B?dGZpTlV3MmZkeHNJYjMvTlU5K2o3NWFNbDdHZEtlYkRoMndxYVpOMUZVTEVW?=
 =?utf-8?B?NUFpcmxoMG80QWJSM0Ribm5Ma0QraXk3eHN6K1h5UTFlNWVUanVlTWlmRUt5?=
 =?utf-8?B?cG5pZTh1Mjc0Z2FRVFB3RFVSUjRuL01PTWJzNHdMdjJ2WWtubmpLMTZOa3p2?=
 =?utf-8?B?dGlnNXl5TGhYcWpaYjlIdXJvSHNsWm9XZ0F6eHliTUhWMEhkd1lid3BWTEpj?=
 =?utf-8?B?N1M0U29Ja3grY3FFQzRmd3YvbGZtMUNxUEVGQXMxRldqa0xOL0ZjcVovYm5r?=
 =?utf-8?B?MVpnRzJoTkJ3OVc0K00rcFp4ZFJqWm0yWjNYWUlRTHc5NzNCZFFzaUJFWlFu?=
 =?utf-8?B?RHRJbklNaE5GbnFXbUY1OVFkMi92T0NaQ1Ywd3N6cXk3RTF6STQrUy80dm05?=
 =?utf-8?B?b3NkYjh6eFdKL3BsN29BZTdzWDVZNitwSWgzSVVXSjd3Q3dRc2dDMExTU1N5?=
 =?utf-8?B?ZE5IOG55akxVRVlvSFVLTXhpRmZJZW9OT3RlN0hEZXNYeTZ4RlhXMGhyY1BV?=
 =?utf-8?B?VHNCVWRqNjZOSXI4V3Rkc2RKQWp0bm9yVUN4c1NTQ1B6bXUxQUZRc0t3YU1H?=
 =?utf-8?B?UXlzSmcyRXAvZlVMKytNQ1Nxc1VXVEYvV3V0Skd5VUtHV014L1U3S0JJRnds?=
 =?utf-8?B?MnVOdkE1RHJDRnZta2FrOXhHaHp0RmNtYmpBcFVoSEhoQXRxSzZTcGpTcGRh?=
 =?utf-8?B?MGIrbzRpblA2WTJmNnBrNVpEUXJxdk5qekRYZWsvY2VxTDNDamczcEFzRHZi?=
 =?utf-8?B?TEVNSzlPZ3JPS0lVQVl6RFVUa0JORmZCd0t5YUR5YkpxWVBFZ3VuM1pFNkJF?=
 =?utf-8?B?R1BhMFhXbGhJY0NXanVWVHRKN0dldFJEMW5rbVVmSnhKS1UzR0VjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e483e14b-4eb2-4784-b718-08dec89cb1d2
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:07:25.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzvJKggHmI3mYLJKbOXdkqvtXwFl+DOJWFmiFVcPGsbmIxfeeWBBUkHU6VLoSsDWJzdD/1LVy9sIg6KTRXu+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9226

On Fri Jun 12, 2026 at 4:43 PM BST, Timur Tabi wrote:
> On Fri, 2026-06-12 at 13:06 +0100, Gary Guo wrote:
>> This would be inconsistent with the derived `PartialOrd` implementation?
>>=20
>> If we consider Hopper to be after Ada, then we should be able to `assert=
!(GH100 > AD102);`
>
> This is a comment about how we describe things, not how the code works.  =
It's because we
> frequently say "Hopper or later" to describe our GPUs' capabilities. =20

If the code often needs to say "Hopper or later", then I'd say the comparis=
on
would want to be consistent with that too, no?

When would you want `GH100 < AD102` in your code?

Best,
Gary
