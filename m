Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621406;
	b=m1LEm7KzLXWxeHn3vQo9nuV02rr+iPGanfq5/8C2+Npyx6TzG5g839JWkkhYq2LtjN9y
	 Fo+hw/gHpFvwl40ZjNjA/RC27y58Ib/SsFoFqVagBo/KHWW5hsbW6fBmr3BzFaMV8zFq0
	 KA4tQk2yzXFhCXqF8O7PqLM3gYktzdEETnTODjmXMz3ZGNvQAFiFi8O7bHzRJaOdifVLr
	 wdbQj2fvQSzjnso0eVeq+88aazq24ZsjKoWcYJnlX0tJ1BGT3BlO3jcCQjq5Gg7QGlnCN
	 MCcFDDn3F9Q9pxAhzNY1R1nAMZXz5nSHoyiCi5onW6cPMzrLjKcSp+IWNwaT3rTXkDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621406;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=Lxz59UoapK1ro4VJW0GYVQC8o6RhPnoN+N4PXj8YTgo=;
	b=ME2BxPwhnFsDx7xy8PBPN4NZY2+lXLH98SgM1+eL4478ZZlJA3noqibDDMwFcwZTfa/+
	 c0ri/6IjFifp3KilndL1arQdbcWNVyGXxuFSh4fnzMg9Izkz8b2XBCA11FkyWJksyQ/Fr
	 M7YjCqN3vg5iI4tosxajiJhWlLLu8D1UIQlpBXDFw27wE3j72U+lGHf/naUN9QjGR2v4f
	 ql5Mz4AJn60ClHKjP2DfO7dr7qy8I/586VsZ7nlfwZ9GMoj0UQzd0OknwTlOBhRc3T6fy
	 M4jE1e6hczSpYI8IU8erOogVuKPLoB0gE2USAIevbSaSR14g2eX5UzSVNbjI1XzoYZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XzS6McJ+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBD9606A327
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBD9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XzS6McJ+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOndPaXtaodeJJAYAU6TS+INhlbTJxqFgK+bXUuqd5Xi2vT/QJCCOuGXrjjie5D+wz0KT3Kfpm+vyBFPjKD1vF5lpkN6Y2fP5424HLELBqrZloc3eTwBoM5DITWy87/4Tdk83K9yhO9ik+Ca/FzkMQ8WXq9LF4QzVC5fnI84nbkhixC9r7USzolxx/g0wHi4IPmg2IjRF0Wupjloh2qKAdWeE3G0/m1Ay/x34Zf+Ogfhhvb/7SVvqhV7T6wZ8A5OqxvhghH9mmoJUQrDsWfjOx0TWzbsZdG5prl3PjwrrpkGGedfolJKdzppVf8mTAxyLzY8n5Kr6PsDH1DWao/lBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lxz59UoapK1ro4VJW0GYVQC8o6RhPnoN+N4PXj8YTgo=;
 b=onxVgxYVxIoCt6gP62VsLahRtmvcjnWhO3B+mVDoWlLwR7D0e18sqYIE4eznO/AYTmCjYlC84MV0ipUY9kRjrecMojiqVZ8E8s3BiNM6KyS7iZGiG9/7C9At4PPZ49TdISAryLs83XGtFXW4jmg9qCCVeDwrIjZHDxFWFV7LufNRJ4u2NTLuNmxAydtsy9RaPYRYK08OhkKuDNsdzv0RMNRpIXs/1rnzt4cswdVjd6iFckhIDVj9RwgY+sHBVZDGLpy11pJXN2N1nhdAQ7WirsgCpF6gB3zM/d8+XBpGmyhudYNSyqFbh09npPgHEZiDiix51QkFHd5LJiBH2u2gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxz59UoapK1ro4VJW0GYVQC8o6RhPnoN+N4PXj8YTgo=;
 b=XzS6McJ+1GWo6j52yQ1uqaCa6tUyOQlUd5Ew8N0oTPlZvxhv+/7gSItL23bXxZegv6+ZvhaytqPCXFyAyYsDa42IeKxkyOeBstOXdWX9v1AgC3rm+uqRlIOrkmhB/JWDFSgz8y69fGeu1ryUVa18TFpytTR5Op7O/CxneE8LO2426eJBiXHih/eQar2oyBkkXYZSHWkTOaPMZ4+6qTWT1ZZY1HnHC6OVfAsgcZUe9KyyBP3fJNqZAhZlPjfbBvsn5na5TKO09m5mzZ5FaFoxZUY9n8f/1h2BTcK0C/T/SAGqmZZEg3T2IqM+76SFd/MCaZSQVRy8DtiGa6OpYbSVBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:02 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/5] gpu: nova-core: gsp: cmdq: preparatory changes for
 r000 support
Date: Mon, 02 Nov 2026 21:09:51 +0900
Message-Id: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ6CMBCEX8X07JptxUY8+R6GA90usib82GKjI
 by7Bc8ev8nMN7OKHISjuuxmFThJlKHPYPY7RW3d3xnEZ1YGjdV4RAiICNT5J4yBR7B0skVhdUl
 aqzzKYSPvTXirfhxf7sE0rZa10UqchvDZHpNee3/lSQNCYxw3jvzZ1eW1T+KlPtDQqWpZli+ui
 1KcvwAAAA==
X-Change-ID: 20261030-r000-cmdq-prep-6c5644619c11
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0175.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::14) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH5PR12MB028906:EE_
X-MS-Office365-Filtering-Correlation-Id: a347fa75-35ca-4e2f-657f-08df38da3952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|6133799003|10067099003|18002099003|3023799007|56012099006|261021123027099003|11063799006|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	8IQEwBAfG6hq/R0qOwLJAS4ZtPXl1/3w86V/8ngbThddtCvZuQhtsUMwETezFf3bo/tnF5mI25MGwlitHuoQvuu3M/ip8ijKu9/IqjMdVHrXxzQoUVL52ZXpmNSKwPbkAS5I+ipd7lkzRyn8J18STD0hCy5Po/0H3brgPtjuWpM2/4FdPe6d8IToFrcUwi4clm4RKhJWp/nv9ch7Cj9Pk5qJM29CkiM2F6TyD0xroQ/4UrS6hsOtOcjolboJCgwHjz9xTkemYD86SSfIgL7QMXA05/ohIeGGL+ec74EuFofj5h15ibW2u0UgvbEA61C8IfWAxfkU1yMgI04ZkOXMNguPRzYmSU53bp9MNgV42LiVgtr8RG4xSYWxk7XwHEoBbS5uGLcKS2x8vSGiD+HcqT6FZYh4y0DuS3P3G6QY7eo7Btp3OWYyj3oxwOiVGgXsdA7U1EHYe13RRq4Pu2KqpO1G5rOMfFQjeo0wNYfGvQZZPOQ6UOrXVUiLlFCKzu8U0hxWempbfRu/ISGBVLZmm0TBSqXJ90oLkoft6HeEoOYJCQaF5t3lxKBuQBT5MdYa7dmdWv1sU0latNSdLmljz1nabgItXYuK+xPui2eCmQvSO6xoOv57m3+f4ewb0udVEB8Yo+m2N6scUK6VEF3hPvDCjoyFoHlrU7J4TdMpdeE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(6133799003)(10067099003)(18002099003)(3023799007)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2paclhSNlVPWU80bWltZ2JLdGRYd3JaaVhMbWxzdjQ2K3d3cWkzSWZqKzJF?=
 =?utf-8?B?bTgyTVY0eGhZNHZwNlA0b25UaW5IVWNLd3d2V2FGOWF2VjVOL1JlK2R4emV6?=
 =?utf-8?B?WjRFR3k5MHFLQ241MmdHT2tWWm1iM0RBNG5IVXlrQ1hRNFNRLy8vUkJ5dlZF?=
 =?utf-8?B?RmNqWGFoZ3c3TXZNWE5ONTlTOExoUG53UnpnMjIzcldrZzJ6ckNGN21iNERu?=
 =?utf-8?B?ZExudVk3UXVFT3hISFNNUUtWSi9ZNnNVTmRzVVRMQXdhNENqWFJicVlKaXNI?=
 =?utf-8?B?T2NzY2FDZENQc2M2RDBsNnI3UFNlbFI0TDQ3SDZ6QVZnNTFuSTJuUEZnZWtI?=
 =?utf-8?B?Q1dDdUkvT2wyRVZLNTM2QlpEenhnUDBVWTM4K1FUclNOWC9ZRFFKS3BTWWZ3?=
 =?utf-8?B?ZUhJb2V1NUVlSnMySWpDVm96ZjAva05nYlYvSXlKZ0VnOWV4V2FBOFpDZFNz?=
 =?utf-8?B?ZkNKbDNZUllvN25CT2dtb3Y0ZVVxNHMwbHNEaUNpT0JhbzNIQ0xVZy9hdWtv?=
 =?utf-8?B?blVmTElEanFWNkJXVHhzRm9ibGRhR3lWaUZMM1ZxclJYZ0FOQmx4Y2xXSGd6?=
 =?utf-8?B?WXNEWmExWU40cUhLV1Awa215TmJHVkR6clRZbnYrKzZBbVlLTzFBQVhMcm9X?=
 =?utf-8?B?VVdsQ3NmYjNBMW1kRTd2OFhhb290bVlVNlJlQzB3MzQ1WElGdXN5amxETEw0?=
 =?utf-8?B?dy92V25OOTJFNzVrK2IvWnBCKzh4amVwY3FDaXo3M3RuajdKdG1RcURCM09z?=
 =?utf-8?B?dEw1amJFRmlSTEJwT2FuYnIxdXkyZ0RQWjhyQjA5YWt0ZXF6MitsZHpuTy9x?=
 =?utf-8?B?YVVyNnVsMTU2Z3lXRTJmSTR4MHhnSWZtT2I2clNpM1MvTVJxbUJiQU1jYk5o?=
 =?utf-8?B?UVJRYlVMVG1kWkI3TmhFNUNlbkE3NXJNZC9hTkdZcE1Oa1dINFkrZzBZTnpr?=
 =?utf-8?B?VjBSVWl4NFpFWEpyOUpqMnM3ODBlSzg0V1BiOUkycktWYWVoMGRlQ3hkMy8w?=
 =?utf-8?B?OEFUVmoxdkgwWmVmME0xL2EvNlNOKzdFZGdaSjBPcjRQQXhybmdETGx1bGJD?=
 =?utf-8?B?d2hoUU9uRkF5V3FKMFhhZzgzNnQxeUk5WjhpY0w1T3lKSDh2Y2tWano3YitM?=
 =?utf-8?B?dVJnRU9teEdQTGhFRkdLYnV5dmQxMFYxdE9GT3NhKzg1UjM0Nmc0VWdRdmVB?=
 =?utf-8?B?MHdpTk1IT25hSUFGWjNDZDI0WWNvdTVlMGlSK2xNdDlUZEJEUUtRRGJUZUQz?=
 =?utf-8?B?UE5od3lxR240MUk3aW9MeUplbDhCSDdqdEpLaGdxZlc1MXFWS0lSbGtVVk5r?=
 =?utf-8?B?NVhhNHArWW01Y21Gb0ZBN2VleVAvT08rdS8wR1F5V1dENVFweEFrcGhVWDJ3?=
 =?utf-8?B?OFNoN3VqUHlkbFh1dDVsMWNYT0V5ZWdKTU9YNlFYcDJuTlptV3RQQmY1OHRk?=
 =?utf-8?B?VysxNHlmK3d4NjNlZUUrcVlEQXl5S25GaXpJUDVtR3RMbGVoUlpoZkZ2My9G?=
 =?utf-8?B?Z3JWb3h0UG0rdThyNm9wTzAxZEdVcG9iME9YY0tUaW5QUHBUbEppYnlHYWJE?=
 =?utf-8?B?b2IyTWsvTnJORGFleWFEeG1kMVZvT1JCTExlN3NrajUwWDljYnZ5Z1NhZFJx?=
 =?utf-8?B?RmVIYVVGbDV3ZXJwZE93OTdveHAxMTVIUkRwWFE2YnBhdTFQbHdrVEkvaFRz?=
 =?utf-8?B?aklWSXpmdHprQkJWL293VXB5dkN6RUhUOVlULzllTUhYZndVZDRRUG80bS9P?=
 =?utf-8?B?WStKa0JJMXU4V3BFM0QrMDhaNTVCT21hWURKVWRRZmdRenE5RnMrM0sxVzhq?=
 =?utf-8?B?SFQ1WnlueFk4R1d0OUE4OU54NUNTVmRSakZOTzVPYWgwV01lSkhVNzFUVnZo?=
 =?utf-8?B?WTFMeThyTStPVFJOZjJQV0NYVURiUy9KS3k4WS9xOTBxR25OYXFEaGpCNmhr?=
 =?utf-8?B?TlFYL0F6MmlxWHVhbUZVVGxBSjA5OGsyNCsrZVlBeGw2V0lZVzZTTzN1bUY4?=
 =?utf-8?B?bGxHQkF4ZlhrMEdScHB0cC9FV3NWYTMyQXhvMHZlNFozaU1IODRZTkVhSVV5?=
 =?utf-8?B?b2d2RVZkcDE0a1JISXVpN2FvT3ozUEYzaVRJTW50Y1lOR3RtVnFNRjlkWTJ2?=
 =?utf-8?B?RXRMeE85OWs1RExqUG9QTmdhRXYyQjNrajBGRzVKTGF3T0pJOXp3WVRJbGpV?=
 =?utf-8?B?eVMrTVFOMnNoMnp3eElyVGxla3d1YnprSkVkeUZLczF3eWdabU04QlptNlNI?=
 =?utf-8?B?MnFUVkE4WFBFakpIU3dIWnJkejhkZG8yNXdWREhUOG5ZOVdBb2ovZ1hwVjJ2?=
 =?utf-8?B?RXo5WXQ3UGFGMzloZUtNdk8wdE53VXJmU2Q3TUkrWllCNGVEV0NGdjB5N1RY?=
 =?utf-8?Q?lLofA/fJrtRdGEED97rEDfkRhv0vUPz451Jehr/hBoKEG?=
X-MS-Exchange-AntiSpam-MessageData-1: azpDuokQEUuTrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a347fa75-35ca-4e2f-657f-08df38da3952
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:02.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7giCJ6l44y7SpuQvN0xDHXPJBlxjwHAZSOI/MaxTsVvZwC5dom4gKYuJS/TMNSulvcbJdsjQr5dLeQdciuj9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

This series contains patches 5, 6 and 8 from John's r000 series v3 [1]
that prepare the command queue so that the r000 switch applies more
cleanly. They are submitted separately to make review and merging
faster, and because they are also valuable even without the r000 switch.

Patch 1 is a drive-by fix of the `NV_PFSP` register declarations that is
included here as the `NV_PGSP` declarations mirror the `NV_PFSP` ones.
Patch 5 is another requirement for the r000 command queue.

No functional change is introduced by this series.

Applies cleanly on `drm-rust-next`, and runtime-tested successfully on
Ampere.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Add patch returning the sequence number of posted commands.
- Add `Fixes:` tag to patch 1. (Eliot)
- Deslop a couple of commit messages. (Eliot)
- Use I/O projections in the command queue. (Gary & Eliot)
- Link to v1: https://patch.msgid.link/20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com

---
Alexandre Courbot (2):
      gpu: nova-core: fix stride of NV_PFSP_* registers
      gpu: nova-core: gsp: cmdq: expose the sequence number of sent commands

John Hubbard (3):
      gpu: nova-core: regs: add msgq v2 BAR0 register declarations
      gpu: nova-core: gsp: cmdq: ring the GSP doorbell from the queue memory
      gpu: nova-core: gsp: cmdq: compute the queue regions from a count and a slot

 drivers/gpu/nova-core/gsp/cmdq.rs     | 187 ++++++++++++++++------------------
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs |   4 +-
 drivers/gpu/nova-core/gsp/regs.rs     |  22 +++-
 drivers/gpu/nova-core/regs.rs         |   8 +-
 4 files changed, 118 insertions(+), 103 deletions(-)
---
base-commit: 9fe580fd90e20c8432832c5f9a7e92b049ae9af6
change-id: 20261030-r000-cmdq-prep-6c5644619c11

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

