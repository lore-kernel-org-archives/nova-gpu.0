Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795455123;
	b=04ZfuphhPL228/uU7o/k2elPrF97HvO9dIkY/2b1ULxyKM9a/ceePfAjB1XiygpxjcC+
	 BL4ffDxDkz3NLNTthd2UvM+/K9GLsLEqNbMcra8fTcXSKAz3A1fCsZjnG+OqkkZBWECf8
	 ce/MnGH67maGlgXQYzgaJ9wN3PzDqh2nnpjPSY/k5w9yYVD+ueYElZ6AdP5BQeDh6yqqn
	 P8uH1E5gwNnKML/uFPcZMrfXpZR8QDmJCGxET9sRl7Wxp+gxHuke9xRVoJHQk2xHRUItL
	 hsxzEb9D4LZTZHmS0hhU+7d/NBQ5XbL1nbd6VDDiRsDYgffpMDoJPqoYhjMMukIUEYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455123;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VNaboaFCg4IhZ6hlC1mP8WCxDY9z64xQOVo5MJgqzjg=;
	b=D8WmUgi48ENkt+jZY9Y5NvM0RCY9GDY/PRbFksjyiO/AMyk2x3NK77pKIvuFrrXUGKuX
	 LrTxwgEXpJQgrt2sMST0WKGqnNUEvkzUIa0/0TNYJirfWa4ut9mct+FA5h8eLVjdbDqW/
	 a4iADlSL8FsDjEnM7hKZnalpTl8qQyqHWjNuJJpL+9s1szj5X4p3JACqEYv6Qcv5+K4op
	 /b1dNXJn+2a7to4wQrtdMQPZLAT/2NAqvE9ID0tiFpzxGRwzpWvGJRE6VAUxCIwL6kL/E
	 JngZ5gOEWsPI/1RitezaNrmojrTT/w7NpEWIDtreRhyLZ3oHukHPAko2FFF0x9dae9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UPaBCBwk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.22
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6744A606A33C
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 17:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6744A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UPaBCBwk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtw7Swpy+lWpQBDGoUy5IWCHE7GNfBZ3S5Q9XOGKkhpx/cFd//XvNiGUT8WUpiTWCQ0D1KYHDHSvLlnyAIbP6vZxkyTBwR0YmwbZZ9TgTU9TMrtDndsoYC/1rHhseBrbzoH/slnBf+sAdRRzmV506ox0NtPlOWjkI58voz1uL3t4SnofBmtALeBlSQGkDJdz1DeLLFMSgTgtxqWKNXKEUU1M7LPicU/civBo44sL9I+Y4pDBE0qmWfpAstgdJCZkdwgZ45kr+PENyJDeJQjp2lDdKxPjWB7LxKs9do8YqkQ3/+Rb8x2f9DBIqxIglZkOzcWLdkfhH+ckG22Vt1OEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNaboaFCg4IhZ6hlC1mP8WCxDY9z64xQOVo5MJgqzjg=;
 b=rmHkQXkceDgktREQHqTKeK9P2vaNMOKMdE0XBDOOQ/Qbvnrb8Dp1Ymd8/CkYI6JT/ve8Zx3hm4ZpJkmPF0FKhrwi0cQKMD7wrOAaGq36hSozVWukrA2/5bu0mkQY0oejH+dJJlevlGsXEhVppiLnlGEpL7VHUXn1WcVELKzOflatdLYGmwnbc2uUAJhzgdJYB1Kz64WKpAlkftRpv0AcvWG7vSfq7YKBWTplRjCMVRDEar0l0G/zpsHiTN6RXMf2/qmTbkt4h4LapdfMwTcIBMaDpdlD8UjnBxMufzXxJm0sOQK5iO+V0v5RB+QoEUcU8SkB0Uc4TS+/vBcCe0RCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNaboaFCg4IhZ6hlC1mP8WCxDY9z64xQOVo5MJgqzjg=;
 b=UPaBCBwklWUuN5qcvGmIUrkBs4YO4ouge66hH+Ct2ymMt7ZCj/vAPg7rvtnjNwAf9/6ubeeQDOoW3Liw3HaUG9+Jb0onRyvgaDb15b5m6g0PuOroxFybt1aDYXERm6bjWfAN6MhdVT5MINRbgzYmW/bTslYFj6IlGezREMUc3XYHYvwYijmpTJbY3Cx1NLig0OyYhO3vIaOkI2fFxZKNp6crh8RyZY1x6sf3Vy6hRrsswk09fE0lskcosNTzuBnq+jTKdE54cX+b54r6XIuU9JAlu9ndV3HARw31phj730g9LHqFuo/doqY/dOCIqJ61HXU5Yiw+xt7kUgM4TU5sNw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:31:57 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 17:31:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, Alexandre Courbot
	<acourbot@nvidia.com>, "lyude@redhat.com" <lyude@redhat.com>,
	"dakr@kernel.org" <dakr@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
Thread-Topic: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
Thread-Index: AQHdevV1CeKNg9t+Gk61EwGujWgeqrc76ycA
Date: Mon, 23 Nov 2026 17:31:57 +0000
Message-ID: <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
	 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
In-Reply-To: <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|CY1PR12MB9581:EE_
x-ms-office365-filtering-correlation-id: 3744e417-c74c-4966-7c39-08df4987acad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|38070700021|261026121527099003|10067099003|5023799004|11063799006|56012099006|4143699003|261026140227099003|261022105027099003|261028144727099003|261102123227099003|261022075727099003|261021135927099003|261021121427099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 3bRpWOZlcOtuk2RB46HvanXItTD/dm+ql8hd2OzfLdeli6+F/omjqM3IoaJJuNtdR9yGbH8aimp2L1brxY/WiXSVurLai34jPHQM+qy4Y+4bZeaFFhG9pV6SjLx9h+J4Nxk/LrSWdq7AbohFgs2K3Md0DPCEW3KMYLU+0HuWlx76/FnHo6w7OEu4kmBJV5pq3kcNTqp5lIzDlJAPmzTftlsVL/MUXW3S/m5UP4BlsTMnYG+CQFx43zemumohSUH+lyceQZ2x+AJhErQEPMPlpDoww33ePQie2EigS/ItKGQcls6aD7Psk5Aarpd+e5rP4d6PffUgyHjdaYUv/76E5cBSg+JTniv6zhrixPF/DBTQ2CKwpETwZR0VSO81Iy0vUhc67zPlAiZRY3abR9WyYrCpaiwIg+KZnKdbddFSvveSvn34BuLnkzm51aPAIHyyBF79f/+skVOUEOGBxXuK1nay4uohzq2ZcQ3lVjoOosog0DIsaKuR2belNl6hU6uCu/hWtm1qYDqWO3JKS2V1SMijMk81oQMOzXLI6LD97p8TkXIJA+gbZuLhZ+RcPKsxcY+8dHDGLtjcJYj3zwm/pZlIvkEGKP+Uvp/Yf1EJjwygYF+GYKOtJHd/ImMGthbAoMQlARhfZHGoJkQxaSiTb+4eDNmRz8MwLak8MB6DbRlbk2zz90R+/qyJt8gjxkjjyVRr9GZUutEKSuz6/ZOBhsDaTE+rcyElhTrPjGpWs4Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(38070700021)(261026121527099003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(261026140227099003)(261022105027099003)(261028144727099003)(261102123227099003)(261022075727099003)(261021135927099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZktyUDUzWlNGZXVzRzQvTmhZK2EyT29JL09yRHl3blVjS2l6VlJCOG03S3Jv?=
 =?utf-8?B?K0xTODMzUGYwWnB0UDdhbFU2WGpVcUJyUjF5ekdodkovUXk1L25xRlJ6ZTg5?=
 =?utf-8?B?MmplUHRpd0pBYndMYW8veUtFQUxJNzdtdG5sQU1VS0dhSm0ydllHNVBrWFdk?=
 =?utf-8?B?bkFJaEFKeEdIbUNsT2taN2ZNUnA1SUkrVmxJUEdLQXJsUHc2Q1JMUzhzWU5a?=
 =?utf-8?B?L3BTTEZpMktJL2k2ZWdJWEhNdE5uZEprZGxmdDZrN2xlTFlEZEtOZkhKclhH?=
 =?utf-8?B?TW5ONUt4V1U2OUQ0T003ZWEyMFpBdWRBcjg4cGd0V1VwK0d1Q1V3OWdHNWpy?=
 =?utf-8?B?NnJQS08wQnhid1dteGx1SldZVi9XVnJIckdaTDlIUkg4cFlvSG1UenZJbnFF?=
 =?utf-8?B?VnBqdDNzWGVOMEhVd2lnT01mcGRBaVVIUWV6MmcxdkI5L1VCZXZTblpwZ0tq?=
 =?utf-8?B?Wk80UXY0andNdGw1cXBNT2VGUzd0U29zRjk0eHE5SjRVVlBKZW55ell6MkJ0?=
 =?utf-8?B?ek1BZHc1UjRmQWVlMU8rb2dJTktpZGNxbGsvdm84NzdrTFQ4UFFnY1FoZlNp?=
 =?utf-8?B?cHo3TzdJaUtqdWF1Y0lQZndJdHYvRHgram4rTldKVnVaNExhQUlCbVdQTXJY?=
 =?utf-8?B?c3lxQnBUSGh3QmZFanJrSTZHWkhaSGc2VnBGaFpPTUh4NElCZUROcVQrNTh5?=
 =?utf-8?B?ZVo4bk9jTFIzTFc3RXoxYVdIMTlyeVJzWVdQRjZvQzdacmVqNzEycTZWWkk0?=
 =?utf-8?B?T0JoR0NUQVFFaGtSYWtRbzlncU5rS3Z2b00vUmd4YWs1NDhjR1B5aEhVYndr?=
 =?utf-8?B?V3k3eFkzUjh3T3QwKytjR0t3b25ET1NvODVmSHY4Y0o3TWcxNUNUSThweHM1?=
 =?utf-8?B?ZUdMdUt6WWQ1blN3YXZiZ1dBKzZaYWdFY2dsT3JPT1F6NzN3bU9TNEN3ekhK?=
 =?utf-8?B?NnZxZmZISis1bVp4N0daUHpNWUZWaGFlQ3FHR2lPRXowNGU3UXQxV2Z6MEYv?=
 =?utf-8?B?Ym1ndmkzYlRrekxYRUV0cG85bGg1bXE1eXowVWo2N1R6YjFnM1F3L1Vzd0tS?=
 =?utf-8?B?OTkwQ0lEZUZFVktnV3Y4MWJNdW9jQ1hKWWRNakFxOG9XUUVmU2txSFVoSk9a?=
 =?utf-8?B?SWFPU2JQUW5QTUNibTRtaDI0ZWNaUEdIK3NGZVVJWjZQRjkwV3EycE54NmIy?=
 =?utf-8?B?QU5aT1JPSHFIak43Rnk1NXlCNllrakpCbkc5WWlJcTNVNExEZG9UM291Zyts?=
 =?utf-8?B?UkZkMjlZc1hiSUs4NFFxaTUyZVdmQjQxUkkxbGp4aWdJanBMMFl4Ky8wRVp3?=
 =?utf-8?B?YUxESzJuUHJ3dVlqZC9kVnhNOEFVQWh1L0g0RjJrbW9lZ3B6QW41VEdTZzdz?=
 =?utf-8?B?Ulp1RHdOcDNucGtEdTA5eSt1Q3hHR1dRd0VFcnlScnc1dDdIY2FwcEZzcEU4?=
 =?utf-8?B?Z3R5NEZPRVM4UVU1blFnM2I4cmZISGtscFpCY284VFh3UnpEejlBaldOaWhI?=
 =?utf-8?B?Rm5wRjdOVzh6RkdzQlpMeVpQK0o4aGlKaDFzcjJQVDUwcjRjRndaUHNrb3dQ?=
 =?utf-8?B?M1VzTHBRbVYxV2d4WU1DSXpNQUNTRjFJdjY1aXBrTkFQSXlGRUFiZUg4VFNn?=
 =?utf-8?B?Vzh3U3R4czVSSWd4czVPbGxGOFNBNTN1b0NMOTZaMWdEWEJ6VDF4eS9zb3Bt?=
 =?utf-8?B?TG5DMDNqbmFLK2pZT1FyQnMyM1c5UXdXWmVaSm9kdHZEUDQ5QXBhUG1LL3NE?=
 =?utf-8?B?aVF3Mk5MckJIenRVQVdmRHpxNzRlaUdDTXcwb2thWjBNbFVvK0kyeVE2SVdF?=
 =?utf-8?B?ZWdZME1ab3d2OEFmRFVVazZ0NTcwUEtTRVF2QUtIWnA3M2QvdUUrL0VWU0pJ?=
 =?utf-8?B?SzIrbEtlMlJZZXpOQmFzNjBrcUdPOG04cGU1TFpGeEdoR1htSjZhUmJzZnFY?=
 =?utf-8?B?M1B1cUF0ZUtDVWJlWXVsTWo1dmk2cUtQbmRLWDd5dG83ZWN3ZDE1ZTNXQ0VQ?=
 =?utf-8?B?Z1EyTENKYVc1akNaRzdDNmlCdjlJR3BNNGRnanA5OHg0MDZ2T0hKWVpRSGxz?=
 =?utf-8?B?dU4yakw4eFNJTVZvcGNUQ1ZuclBoYVRZQWtnbjJ4c254WHE0RUpFVURhTnFx?=
 =?utf-8?B?L0VIaGdsWXBvWm5UVVFUcG9OdURlRUZkNzV0VDljQW9mVFJWMTRGSEEvZTcy?=
 =?utf-8?B?NWJCUEk3KytncnBaeDhHNjJRY1VDbU9kSXZPdTNNRm5rb3dtRE1XalByUkk1?=
 =?utf-8?B?a1N1QUcyWWRDVnJRR1NGV2N1VzBDR3lDMkRuWlo4WnN0U1JhbDh0SW9jWVVL?=
 =?utf-8?B?bHg5YjJFeDlmKzdjanRTY1g3MXJIQmx0MUtQTzVGN1pGRjBoRDBaNDF4VnQz?=
 =?utf-8?Q?k71d8jr4Zz5jIXVX5+QZW2g7pfVOsM2pLCgKhH/wp8esa?=
x-ms-exchange-antispam-messagedata-1: j6QoB9nUL0UBEw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <22C60813CFC2E2499FF63D559AF246B0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3744e417-c74c-4966-7c39-08df4987acad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 17:31:57.6101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8w/ZkYX9PcUSASpzgvuRVxcbp/iVXLrDUupnQWTUb5hv33ouBVaDERcuIS8KWdp2gN3PyEDyV8fGyyVvEQJOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581

T24gTW9uLCAyMDI2LTExLTIzIGF0IDEyOjUwICsxMDAwLCBEYXZlIEFpcmxpZSB2aWEgQjQgUmVs
YXkgd3JvdGU6DQo+IERpc3RyaWJ1dGlvbnMgdGhhdCB3YW50IG5vdmEtY29yZSB0byBiZSB0aGUg
ZGVmYXVsdCBkcml2ZXIgZm9yDQo+IEdTUC1jYXBhYmxlIEdQVXMgY2FuIHNldCBDT05GSUdfRFJN
X05PVVZFQVVfQklORF9HU1A9bjsgdGhlDQo+IG5vdXZlYXUuYmluZF9nc3A9MCBrZXJuZWwgY29t
bWFuZCBsaW5lIHBhcmFtZXRlciBzd2l0Y2hlcyBpdCBhdCBib290DQo+IHRpbWUuDQoNCkp1c3Qg
RllJLCB3ZSd2ZSBhbHJlYWR5IGhhZCB0byBzY29sZCB0d28gZGlzdHJvcyBmb3IgYmxpbmRseSBl
bmFibGluZyAiQ09ORklHX05PVkFfQ09SRSIsDQpkZXNwaXRlIGFsbCB0aGUgd2FybmluZ3MsIGJl
Y2F1c2UgInRoYXQncyBqdXN0IHdoYXQgd2UgZG8iLg0KDQpTbyBwZXJzb25hbGx5LCBJJ20gbm90
IGEgZmFuIG9mIENPTkZJR19EUk1fTk9VVkVBVV9CSU5EX0dTUC4gIEkgd291bGQgcHJlZmVyIGp1
c3QgdGhlIGNvbW1hbmQtDQpsaW5lIHBhcmFtZXRlci4NCg0K
