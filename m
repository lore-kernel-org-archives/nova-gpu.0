Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793622615;
	b=LLKBcAe1ygO7Kk16/95YtRITn25bgFaXTHglY3Dx2bv82sp9Yyn9PFjCrDt5dVi9xR0h
	 DMcUOrtkkieDw+2T+TFEf7qvl1m3cqhltlM/FLPKZRNYtAbFnvkIkWXx+N62rXeAPeUtA
	 lOQR10VDLSzTHsZFQnQgAPvmb8CGIHaN/9PjZB/s6s/oqtIBiQq7JV38b2D5vwwv51mD/
	 h0H04xncKHdnegr2MTiO1OdNPRLghTbuKU237I+I4aXQClPyAZrOjyD4TFwCb+7EVNu83
	 OFH6ZxmYHsuY6WW1UoVTJmTUh21PUafV96ECXMEESMQWQfREDXqTKdt1mvGnld08NPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622615;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
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
	bh=J7WOeLxDGG9f1TnMXeUbfqLg9C4RqisxSiDL3UVRKRw=;
	b=R4XYHKhv6REN8rSxl6HqzRoatWN/Qq3aBKkSU5q06gwP8nmkm50pCx3LnlJS6/VaDHOF
	 XUu0MPfpOdgIG/jTxeaEJi+6UTKqtCVN//I2IhK6+qrW42DXxhzJku1XmI/XozPwPRB6w
	 mbHRjGnDpIalmoRnpNzjSDr4E53+kufSyEw1CVLpSPx9LY44f/+/aebWyuHVMXeMrHeEx
	 i3b6VVxKl1FNC2ZXSO4+FrJoNOF91ooLdZhbi1KxEvYTtxas+tRh8g/wTjsdCPvPrVtdL
	 3PSX8A8X6ty+p9rwr4oM7+/h/NlBJswo+r0kfAweENDv1+TyYQ5gVga/FQlNw/e7dbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Gt1PDd/n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.54
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B066606A336
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B066606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Gt1PDd/n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1k+xIkuSsnzTmCRbhPHLa2eDLToh1+utdABbiK/KSBBdc4iuQdUqoJdOsdVghP+CJpMdBFU4RPNSwcET9RoCd+ZDs8+i/C/nckf5Lpom4E1FVk6XuZbvYrq54PU8sMwWuFJjDe1qFQdiyGBrprBdX2jMICLceoLegZfCXYMOg1bG7lGE1EFapc7o1mfUgWAINqiL3xF3B1DXFdZCJ+Kqo9qBnLk4NeOLu8SM5ecOpRrH/GyGHh23Seu/MA2lO73tshlBmxqz6tnOHY/DM6XdoKIvXWnlG2TCFWMvExtxzbT7raGAVsdmfHOL6ZC23lH5jz9ZApMHuB2btqoB1pIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7WOeLxDGG9f1TnMXeUbfqLg9C4RqisxSiDL3UVRKRw=;
 b=jGTCOoFdhzXU5zHJhZfx3CYmriy8Rk0u1yR1H92wQ9zpg5zISJnAnzuOQNCaOTcVC7R4A7Avt7j9tX/WQC0K/d9zssxvK8w8N+mOOc26/vQq+z3Pxl+l584xsMen8tDxE+AEOYKFiCgGl3Zigz9fXWxh2T5c0L6APXYOGUYOaa8A16vfx6j/T5OAI3Azpqkngp8YlJTxqwZ1+64IDg9cyZiWMaUc0LLHUF746apMKBrXqaB76drJvm/urXQXw7sa9A1kG9M7DP4apoPDxplzEaH0252PeykF3HLIAmek6XTSmYHKQ1iL0ziP876lAO4iZ5vJZQqsTX/dK9U/ouQ+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7WOeLxDGG9f1TnMXeUbfqLg9C4RqisxSiDL3UVRKRw=;
 b=Gt1PDd/nG80lt0T2tQFfFqDaLzADZNLy693VV4oDwCl1DbFVaSn9/SUAjaE2i9ugnfR1iDJLAh00prITibEsFPXkk5Y3JssGMTtZa7sKd1rOzp/tORR/ksmyzA+LkXbhV5/0QN+PF736O/QoblPCrvPZOZ1QMAyvWdyeiRI+yargT1722mctzWGVP9n+qiSYDkg1xlWH8d3v613owaVv0OokRSDcZdQVA2NvNSGoXa5UQ4gTc9+r5FQvNmssA041+PKoAzWmcI2Ajq/+hxExv9GQSorFR0GnU9t798tVcKstyu8B62KNR+LFOpMfZ3aNf3B4r64EJCcQeGH2SmTy9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Mon, 2 Nov
 2026 12:30:11 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:30:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:30:05 +0900
Subject: [PATCH v2] gpu: nova-core: gsp: cmdq: reduce sleep delta in
 wait_for_msg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6tqYzGDSuvIchpLYDjEmptqVqC
 HcX8AAuX/L++5OIFJiiOBeTCJQ5sh8WwF0hTK+HjiTbhQUqrECVShpnn81Lc2pc7JrEjvyYJFa
 2BcDyYEGJZfsI1PJ7617rH8fxdieT1thq9ByTD5/tOMPq/fvIIEFqoApPFo8lmsuQ2bLeG+9EP
 c/zF9QJ0frNAAAA
X-Change-ID: 20261030-cmdq_wait_msg_timeout-26df11234d10
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:604:254::10) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f3e9f4-3ba0-45ab-effa-08df38dd098c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|261021123027099003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261022075727099003|261026140227099003|261022105027099003|261022115727099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	o5qE12Qbya5ikvIyNMRE7ccS/bEoZBF9VwY+l7lsM//CwlUvGpmUF+YmGHOoQ/CP1rin6UtaVOzc32A31FbpJHH+o+yP7hx56R43vRpx0cGMzeNrk58qaxbFLOJrrlwhYckdfR8AgPxhNcInGlD3N9xDOnJ5GqLOXTaLzaOBhenSjSZkiS23R8vXrK7gdaWqcsF6E5fZDKvOoDBuRgam2c7V7ElPRVLEuDx6ZqvNVR8mqCz0bphfAzCbAxjwub8Yxi4eh0pTkU0q1Vv7rlJB7OHuJYeW7oLeuQalVxQtIyrZwqOqU4Smi6c+J4/UsxutGRj9UaNKpvCaqlppQbfRmHTsLcD+DUtr+C1+z0a9hddj0Vw7DL4tQ/UIxs1HhKIlDvJPbFXKZ8RrxDeRxcejpLTBzq683z0Si3QsvGiIRK/iKY0xQNMiqarnfSSHIP62volfX5nwulB4n1whyso/sElP9kUNReA1XX7hybcwyxGe9nKcZSLLPTOnqZBycEnsZrODgUwrHRR3PxoaBvKlatPVnccuXGf3fWzz+0OHFIohkV2IFrs4zeSjYGwkPozLz7HZEdj0466SBsGwMQeAF/vpzMd7zjd9J6uUtwp2qW4+VebEDwYJ4pR5CPbBGEx71gN6jMTRnTSXYUCpslmvXsLxVw9Doybz5uhcmov5VRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022075727099003)(261026140227099003)(261022105027099003)(261022115727099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U05UT1VlU21mVEtBVjN2RGdGVkNtZnVCdE1wY1pCMTAvS2FRZTRmSURTZXow?=
 =?utf-8?B?eXQrdGlVZHVHYTlwRUdXODZCUGZNbE5sTEZLRHVVejV1Z2pBSGRWcE85eHFD?=
 =?utf-8?B?ZllCME4rU3VMVU81NDVaVDRCeFNFZzNEdlM0NDMwcm9CNFlaNSsreDY2dXpV?=
 =?utf-8?B?bnl5WGM2dkRQRnVkRDJRQlc1bVd0TTlsczhTU2tqUFNVdisyb1dLcUZQeFds?=
 =?utf-8?B?ZzdBQnNHZnd4RDJUZjdacWxEMnlwaVJONG9xRmdOWE5ac0Jobk92cDk4SXV6?=
 =?utf-8?B?dmRSajhJTGpCYzBJemxodzdHdFJrdFNtTldwQ2ZHVXdCZnRDM0xmYWpabzRz?=
 =?utf-8?B?cHIzbGNEb1ZSV2RKWlVSSXhpeU85QWVPUXNwVmVucVZpMjljdS9kSnRQSXlM?=
 =?utf-8?B?UDkwenNGKzFkMlg3NGVPQXRRY3BMRXFOWE9ZSzFSbWlFSkJ4ci9ROE5tMEhl?=
 =?utf-8?B?MDV6NldmSVZQQWVjcEVNaVozT2Z4VWg4WUdKb0tzczd1RTJHTVdmMjhNK3dW?=
 =?utf-8?B?ZkMxdWc1aysxcHVHT29FVWJodkZheW0vaVg2OFRRYU9WYURiN09GTTdaNnBj?=
 =?utf-8?B?L08zQmpCc0JNR2duRytQRXA5MldVY2xHT3VXbWY0Qjk0SC9kVnR2Uld5UVdO?=
 =?utf-8?B?QUJvZXZhbXYvdndsaTJhSVFkYnBqWHFEcGExM2o5aUZZYXRnRzc5QXZTbmRn?=
 =?utf-8?B?L2ZPV2V4QVgwalJHTGY4Vjh0NmVtQThtY0Q1SzduSjFnc0xEeFNLZUx6azR6?=
 =?utf-8?B?bC94RWRUenpuV2VmemZpNFUxRVdvUHFlNHZZWDAyYm5VNjhRcHhIcW96V21q?=
 =?utf-8?B?WmJxZ2tBcXFuQXJBQWZZT0tGWFZaS0t3QldVRGR2Y3FOVUVTaHpFVmUzRkpi?=
 =?utf-8?B?TWI4bjNROEFWQlRSYXFNQkJZODY5QkpkQ1NMRCthNE5VeVNnYzhOaWNkVUxn?=
 =?utf-8?B?S1hLWWpyUXdPUFdhUyswK1pvZHh3aURsakNmM2FMYXlZRVczQmw1WU4rZjRJ?=
 =?utf-8?B?em5HZEpORUhlUGpCTUJDMU1DWVRXMEUxRm00bDBtVnNIY2ZzV0Y2NnorRU9R?=
 =?utf-8?B?dUtpYmFJQjRJQkkrODhJUWRvYU5EcGJKRGhLendzV1lTOEJrOS92eHRCOXJJ?=
 =?utf-8?B?Q2xPNk04YzdzWUd1Wkhja0FFTUwwcDRmZnJzejNUNkRXaHhTUDhIWGdkeGxs?=
 =?utf-8?B?eGxXem0ybjdmNXVFK0U3eXV1c1JZYmpJTjY3TmZCWVo3V0FBL0NLY04zY0ln?=
 =?utf-8?B?UGFickNjZGpKczRzN3E4cFJzMjRzQVN0cHhpNXZpMlFqeDhWVjFmamJteVha?=
 =?utf-8?B?SVZVL09IRzdtTnVCYm1kemtTNEdVbmxacG81SWxzQnBkcFIwM1J3TE0raURw?=
 =?utf-8?B?MXdhQ09qZjhYdGhZSmh1T1ZWN1Q2WkJQcmxBSkNlUE1RQnliTTNKMHJDaktx?=
 =?utf-8?B?U3FJeWpKR3JaRzR2YWEyZ2lKS1NOby8raWE4WFlqWEtyT1hBMzBEZEY5ZXkz?=
 =?utf-8?B?MlB3eGVsWTh0QzhHSzdScXRrN3JkbW1CekdnblFRb2o2ei9mVXBjMVdwL0pw?=
 =?utf-8?B?NnhQemFTTHUrOEIzOW1PbGNFQ1M5QzJjalBxcFpLK292MW9uUUJDdC8yNVpU?=
 =?utf-8?B?WWZRb015NDdaVjYvRjV2OTVTejViRlphUVV0QjdtaGR6TTgrenlqY0QrTHho?=
 =?utf-8?B?Q1p4UzNHejlGZjlpbDBFRnVaaVhxbFpKa2sxMVpScGpEemgyb3pjRCtsS1hF?=
 =?utf-8?B?OEVNRTNXSlBuWUdYa01ObWZ0TXYzQ0RRQlJ3MVprekZOOWx6c2pPU0R6V1NK?=
 =?utf-8?B?VFo4alRMUUFOYUxPdG81SWxVUXU3eCt6S3lER2dESmxoMXVJODZzU1BiTEJh?=
 =?utf-8?B?OFVQZXpPYjA4ZDJSOWxXSitGS3pCM0hxRkJMOS96dkpQei83ZmJTZWQ1d1VZ?=
 =?utf-8?B?SUVmNUY2TXJEcXBOR2FzNytxRDNEMHUzVkkxd2dHeVhMdHF0T25XM3p6a1lC?=
 =?utf-8?B?MWQ1TVlCbUp1cFY2c2ROZGdSekFSeUpXSzltSXUzWDJOUGs1NHVkTjlWWkN1?=
 =?utf-8?B?SlJ6K0ZrTjgwZFh0SXBsc05KNDBmd05xYklqNDdTVHNQQ0ZvTWsvdUlSenNh?=
 =?utf-8?B?Q0dNcFBzUGJ6VXRnS0Zlb3FQMzUvNVNJV3p6UkFCSlp0WnYwSTJMRnFBeTYx?=
 =?utf-8?B?ejloazJRUWg4em5Oa0p4ZGdOVFBmZTllWDFLUUlzOWFWQVhkUjIvWGN2VXpm?=
 =?utf-8?B?Z0NVZHhnclJ5NHBKS1RqVWhPQnhMYndHS1JMUjB3a2JIM2NUSkhCdjNsazVx?=
 =?utf-8?B?eVRGdGJUTWlKRFdaL0w4akZ2ajZsdnhRa2pJN2JnRFRoVitqbm1ZK2puMGEz?=
 =?utf-8?Q?4bxd7UIFQe0NYJLAYS+qBzOrv2ZCsvazvyZIJ8rdHKjzj?=
X-MS-Exchange-AntiSpam-MessageData-1: m0BwvK0oaaZrcw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f3e9f4-3ba0-45ab-effa-08df38dd098c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:30:11.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXYkHcjl46PjoBvz4nkqNo47m+jHE9sj46j+1LVtczo7Z+PwsueQivnwWdNUXeIHo0g7t5fbnWyvF2GRxF5chA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079

If a message is not immediately available on the queue, `wait_for_msg`
sleeps for 1 millisecond before checking again. This is 3 orders of
magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
(which does not sleep at all and busy-polls) and is way too much, as GSP
commands are expected to be processed much faster than that.

Reduce the sleep time to 1 microsecond. This effectively makes `fsleep`
busy-loop with a call to `cpu_relax` afterwards, keeping latency to a
minimum.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Wait for 1 microsecond. (Eliot)
- Link to v1: https://patch.msgid.link/20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 936406004a57..8ee8a99e4d7e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -603,7 +603,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             read_poll_timeout(
                 || Ok(self.gsp_mem.driver_read_area()),
                 |driver_area| !driver_area.0.is_empty(),
-                Delta::from_millis(1),
+                Delta::from_micros(1),
                 timeout,
             )
         }

---
base-commit: 9fe580fd90e20c8432832c5f9a7e92b049ae9af6
change-id: 20261030-cmdq_wait_msg_timeout-26df11234d10

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

