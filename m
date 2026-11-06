Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948786;
	b=o8iJEPcMC0ypeA2OibajfFFHrubx4ax6sFeYKIQYaihXw4xw6J0cEOIIhhX3geXmF1+w
	 Dy3X5aDIxfWlAnzfO78WGQpF5Ai5PDV/8Wi3Acn90BXeFB+tslSteF7L55Aq+wEoPrhXn
	 jfUhD50b/pgspi6RjQ6dDf+9XWkgHe7JnPruD7FlW6FGwMQfwl8FMGS1vcf5W77vfLnej
	 CUQWUmrOJZtG9mz+6SGh8Gi+DiazwRnmEZf+Y7A8oGICxXPdJZXPoJNzMev+XHu6wDegg
	 MmeShFcCk10RO/iixGo25d98BL2nguiE9clFjaYIhF1qF6cTm+if2U4pxGW/cIqft2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948786;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=HeVSswBaBiqAM24XoBVJf4o1XAzbINHP/vv7/PSqIKQ=;
	b=X8Ihz3dNRl6Q5xf14i/rELDpPC9WJMiDuLgy1kkUTD0NukwxHkRtwYf+GkN1jqVnqm0E
	 cy7b3YX2TWXQmrvJRbCvYbwgcn6nxhWBjFM+V88VbS9RaUQvLNLzx7SN8uyQDNiInZwS3
	 u3a9iQJQYHpkdLw9V7jzRRh29bnhhaXRnxREWk+BWaMrFQ01TLu4HUfmp4fPRleYRc1oE
	 sLz2TEF40psfdQDIkbFvAVhurB6YP3vQtaFI9wqEzYIg5wEf0uczCEu5GDBMs0pCf79CM
	 TsM18PihI4ytYeGWD8ElMGaFHTaw9mdb9BusQSMS1w6vDn28VxBwZruaNY/xsqQgmjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kZwU8CUt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.52
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E00606A32E
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E00606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kZwU8CUt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtrFKgX4EKRazvVp30mN0ygbbuLdU5AnOsgqC7N+iH90lz8QNQS+b6FLPMmcewn6ZFvWH0gxZfpsgOnKWiv5KwXRkMGCdMzhm6yIFdq81CdjFSvYWzP49qRp5kmCs7KfObRnDuoLQTA1kp94OvYKOT6SCZx3yx7/wsYMmlMRO42syGN4NbMzfHrts/Slb2lBpJEuG4whrl83pUVMhc30zCo6Pw5/nIXaUgwg4GNnGzP03ESQBhRwlnzi9ZUZmFRLaa1k1aXstwdf5ZBxfLQOk4WhlpmdfH9EvtvOG7bGfLTjj9MnPUHxFQyIzNWYxenbvfBs1yeWfYYzAKvN5wL/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeVSswBaBiqAM24XoBVJf4o1XAzbINHP/vv7/PSqIKQ=;
 b=DxeMv5A12OqQIXLRdOlX/SCEgsfdXcQobXqmvOhz8EeJdMHIR4Lo/loJSSzDCc0/PNGJcpkKLzVw73xDdxY9haqg9dscZB0w9yCFCxvCMeZkciiK8JeLgVaQdpabRbwzRuAwkEwizbyNQu3qeAqCo1jb1hTGRaejhTP4h1D00wRG1Wpkw+AXYRda9jDL5K1O4qpvMpfGYxdzmPMIJJxgi+6inkchm4eyg7S1e/bRKKpphVTBmi4fbXKdQZWPtKlfd3IIT+YPodSkUi/v5NyJZ4gaYbeGNiai1eYbLmwBDlD/l40jbp/b9dCdHLxBebmfo2hEX2LWxJ6QDCT6G/MxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeVSswBaBiqAM24XoBVJf4o1XAzbINHP/vv7/PSqIKQ=;
 b=kZwU8CUtq4ogT+EnEEHPA5N26aN7+Yb9Kv3m3m82zmGc/JNZh0zOHOpuKW1jHeMdlntbyx6QndjXn3E6AqG2WwnJNqQozMlCvmQ1uWflh8qvv2u/xoChG1CCOqdeT2rWGb6emlssDCYo9BSXa4t0qgNNcVIj6Iqn91u8QBqnd1VEI/TqQ83BlQJYMZx/PhQkOZQtkgbHCY3z37po1DvoSKECcc/MDWQnC/5lSCi3i932fItvuTcF/9MggmFsw2Ld33Oa8yWgfda1bgmgSMnC3CZlwUCT+yui/AMacbzxFXKjpKGva0KXQ+Jzm+RkWwfu3nPVsH7Qq2KGms370N4dYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:10 +0900
Subject: [PATCH v2 2/6] gpu: nova-core: gsp: add the GMC API header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-2-e481ea2168ef@nvidia.com>
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::11) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: e890233d-8865-4472-738c-08df3bd475c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|6133799003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sshUXU0tDbwa/K9XPvOZj8T9V2gnTHrC7enXxWkJGRSKqpLGi6tGiCEAWOrYEr39DcqbwkiTBmDLeXhV1q2KAmYELzdV0hfCWXg/cLF9ZcjNxCyj2SCkGr5GhIv+5ALWl3SOtKQI3HdQJPi/XXIE1E+w6yVMLfsTmboZAtMlyrPk2dX3NCuAH4JOskikwBhWxVQyzzVaQFDyEPw6aWHPgtDC9Wh4q3SoJGHa3QaDTs8SaGEbTZwrXe3j5wgIZgucSNQlcudf7Tv12dHkP7y+0IRE+uHVboUxBt2L0Ipi0ATr0O25Ev3o2B29AjSWA0vUqeRr68PsfGZnfzALYQ02hBfNOjoIPMjKIYQq0okESdJyXjZ1rgW0+RBIeC2SM7xSucfc2FYb79xtmHneUHxy6fFVsE3dgSFml0ns/2M2vBn7WhlI+29u9opwki2yM84g8yoZEw9pGh+fCimLaOzbikcPTg++W3dtPMKO7VvNDvGglQAAX1S8Pr211koRO1QEIhW1AY4y3PWzWSYXN7yzuoj6P7X/lynhJauNyYmDPPln36GoyarjkusqqXdn6hriivcugIZRFaPvCH90ZqYoxHcvZmqDNvp7FBpqY2UbkuUw+APgTgL3esRMZ8d0Bb6DgrDA59rx3J4UVyOYeMqhG7ZG0AsfmBDqCW/d2xzAoGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDVJQTI1eWU0NHREOXZKSHFBL0JVTWxHVWVQRk5hN1lPUlg5NU5KN1pjUldD?=
 =?utf-8?B?Vld2V3BRVGRTNktxODdpL2JiTDNIQlJ6OGE4WW1TaGpra3FYSWhFTURhK3o5?=
 =?utf-8?B?dG0yaGRVOWg0Wk5HUVM4SGphNC9ZV1djalpPZVROckNKTzE5WHpQWGxyekcr?=
 =?utf-8?B?d2FlY0xWSkc2NE1jMTFsanVwTTBHWXpaNUFzRjBJakJCVkJvQ0NOc0duNnB0?=
 =?utf-8?B?TTZmenRLaDFDUC9tWnV4d0FyblVCNFZERldOUzRaYTVzWGdVdTUvbnhVVkJv?=
 =?utf-8?B?UWUyUmhYMmE4RHhyNFBEbnI3UXhZdHlIallsVlhVNGM3NmdnNzM0eTMzUmoy?=
 =?utf-8?B?YjhGL1hEMGk0bFVaY1NMdkVLVks2WHl0MmJxRGppYW9Yajg0LzMyV05tSGFJ?=
 =?utf-8?B?cGRydEZ5TUN0UTNvSlFzRmVrV3IrZ2JnYzJ0YlBPaEErTmk4dlN1ZnJZaWIy?=
 =?utf-8?B?MHdWR2tBZkZOMjNGUTNUZ2R2RDJGc3MrT2twM0tGM0JuekF5VDVkZkQzK29p?=
 =?utf-8?B?N0ZDTkJHbFhoeXIyTXFmRUhwck9YSm93TTZBL3VkQTk0WUltc2JhUGRuRzhW?=
 =?utf-8?B?M1QxYU16UlB4YWR5V1pQS1BYWVpVUlM3QVlnR2w0WHhCSGF0TlkzZWMyWFNO?=
 =?utf-8?B?alQrTXVwU0FkUnZGcVUzZkNqWEptNnFxU2M5WXI4RWxucEI0aEhuWGt6ZUdo?=
 =?utf-8?B?QzA1UVNtN0tLYnVNaVNXQ3BLQXdvYzU2MFVsQmZwWk56em9qVkpMY0IrNDBv?=
 =?utf-8?B?V3NWck4reVFWcFp4QWR3RVBGUnNDWlZOQkh4Ly8wWEFyZ1FTMDE0dmFRUTZi?=
 =?utf-8?B?KzlWeVBpVy94NG9wTGpzK3RRZHVDT3d1MTZjVXoycjBSTXdjOWlyYmEreWtt?=
 =?utf-8?B?MnIrM0VUSENQakhVNEswbGVqWWQ4aW5veFZaOUZTeXczUVhxb0g1ay9WNTZE?=
 =?utf-8?B?Y3hnMU1ldFhXSjRTMXpzeWNuK3hqOXQySC9tajRVOEo5cVFzMjF6UDNyZnRq?=
 =?utf-8?B?TkpSTXRFU0lhd0FyUGNmZGJGT1liWkRJMWU0Qjc5ZkxOaE5RVHJQMFV2ZEcy?=
 =?utf-8?B?VVd1SkpXT1VHWUZKSTlIZUFLR0pJNFFXTmpHdTdCSm8xRGc2cm1xUUZ2SE94?=
 =?utf-8?B?amtWMXhUOEJmZTllcW9aVlpxU0d0UkVRamFjNVZETnJEenZ3ZnRmdUpxVUts?=
 =?utf-8?B?VTNFRUZkd2N4d1JUVEJnOUczNHpuN0twU2l5eENzcktwTVpzNFoxajE2MDJD?=
 =?utf-8?B?Ly9lbjZzRFhIcmNxZzIxRjAvYW9RdVY3OVA1UXhWMWx5eVN4NWNyRS9kWXpN?=
 =?utf-8?B?YzBhSElLZk1UTG1ZTi9QazV2cFJKejdxZ1l1MXJ4WmxwUXJ2ZS9XeDZHbXVk?=
 =?utf-8?B?UE5zRlg4K1JkQnk3UGViRXJoS0JGVU9Ib21UZTUyRVNtOGljS0VrRDZLbGI2?=
 =?utf-8?B?RVN2ZDFxVHowTHNLK2RrRkY2OTFRNEJTazcyN3FHQW53cWx3TVJhSjRQN0hk?=
 =?utf-8?B?MnVXWThZU0JyVVhrNHhLM3Nzek5OWU1yNkNFa29PWFlwQi8zUEw1U2lueXJE?=
 =?utf-8?B?S3Q0cFVVK2JZam1Tb3RYZHltVGRWZHd5SHJNMG40UkdjOThiUDBhM2VRZzda?=
 =?utf-8?B?eHlScDFFU0hhNUZEaWdYQnpFWitjUXJtVFluZzlWc0ozSGpyanV5YlhNQllK?=
 =?utf-8?B?T2QvN1I1VTRVK2RVdzdBOUdWS1FKR0tuODVMNk04TllZY08razFsUWd5dnVL?=
 =?utf-8?B?QSsrY0dmZVRyVmlpcVIySVovNDA2dHJ0bThnZHphcGtaQVBVaFp5Ky9KV3ZC?=
 =?utf-8?B?STBNb3hsaVZsMkplSXF5RGpldWhHY2FWcXBzenJiWk8wN0xXMlpVOXlPbGpu?=
 =?utf-8?B?V3NGL0FLdEJzZzFOaGZKTjhjd1RWUm02ZnBPYUx3anVvb3ZvUWVhYm9pSGYr?=
 =?utf-8?B?UTJsZ29HMXZwbXVuVFZvZEVraTNxOXAzSTRQbjdZSG80MWNjVWY1Y3FmYnlj?=
 =?utf-8?B?MFozWnFxUkMxZ3JkS0gxQU5WN2xVRVFyWUU2VFdOREVCZGFoVDd4Y3RMODNu?=
 =?utf-8?B?ZG9ZeTArNWp6Mm80d2p0OVJ4RW41LzZGNDhBb2ZBS1V5RjBncER1R2g5Zk1a?=
 =?utf-8?B?WWcveGdsaW9JQThJa1ErN2tKd0FOK3lFOHBPSTNWaUpSSFM3T1ArQytYcEds?=
 =?utf-8?B?NEtPMDRIdlNBZ0tPTzU2N2NHdHNudG1KenN3dFQ1QXdrSzRuR3NLa1RzRWMy?=
 =?utf-8?B?TEJaNTBwVm1PR0tIRWYrZG1KYWFKMWRUNDZIRmtLcktlb1F3M21uYjMwMnBh?=
 =?utf-8?B?S2I2R0NRSEN5ODBscnM2RTV0L3I2Wmg0SWZ4MnBMKzZJZDdIWTRmY0ovanJE?=
 =?utf-8?Q?1vRa9SmYfsven/VmWiBXrQfgDjbJIgssRRQ2hcQlgAnAN?=
X-MS-Exchange-AntiSpam-MessageData-1: D5ImwwNXTPy29g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e890233d-8865-4472-738c-08df3bd475c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:20.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka9H4678zOd4OQtvaUxi0fH2VndXsIiTaPn91j6xwMNN0xSItvu4CBOMgrHmDwUpbXXvPJT/REMo6pMlkcP5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

From: John Hubbard <jhubbard@nvidia.com>

The r000 firmware carries GSP-RM's boot protocol, and its newer
interfaces in general, over the GMC (GPU Management Controller) API:
messages that follow the queue element header with a GMC API header
instead of an RPC header.

Add the GmcApiHeader type as a newtype over the GMCAPI_HEADER binding,
so we can define the GMC send and receive paths in the following
patches.

[ acourbot: wrap the bindings type instead of redefining it; make
  `status` return an `Option` to avoid returning a value whose semantics
  are ambiguous.]

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 105 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 213ef5bfb258..08f97c4e73a0 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -37,6 +37,7 @@
 };
 
 use crate::{
+    bounded_enum,
     fb::{
         FbRanges,
         FbSizes, //
@@ -906,6 +907,110 @@ pub(crate) fn function(&self) -> Result<MsgFunction, u32> {
     }
 }
 
+bounded_enum! {
+    /// Commands of the GMC API.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    #[repr(u32)]
+    pub(crate) enum GmcCommandId with TryFrom<Bounded<u32, 24>> {
+        GspInit = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT,
+        ExecGenericBootloader = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
+        ExecHsBinary = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY,
+        GspSuspend = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND,
+        MmuFaultQueued = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED,
+    }
+}
+
+bitfield! {
+    /// The `command` word of a [`GmcApiHeader`].
+    pub(crate) struct GmcCommandWord(u32) {
+        /// Command ID.
+        23:0 id ?=> GmcCommandId;
+        /// Set by GSP-RM on the response to a request. Not set for requests and events.
+        24:24 is_response => bool;
+    }
+}
+
+/// Header of a GMC (GPU Management Controller) API message.
+///
+/// In a queue element, it follows the queue element header and precedes the payload of the
+/// command.
+#[repr(transparent)]
+pub(crate) struct GmcApiHeader {
+    inner: r000_00::GMCAPI_HEADER,
+}
+
+#[expect(dead_code)]
+impl GmcApiHeader {
+    /// Creates the header of a request for `command`, sent with sequence number `sequence` and
+    /// followed by `payload_size` bytes of payload.
+    ///
+    /// `max_reply_size` is the largest reply the sender accepts. It is zero for a request that does
+    /// not expect a reply or expects a reply with an empty payload (i.e. just the status value).
+    ///
+    /// # Errors
+    ///
+    /// - `EOVERFLOW` if `payload_size` does not fit its 32-bit field.
+    pub(crate) fn init(
+        command: GmcCommandId,
+        sequence: u64,
+        payload_size: usize,
+        max_reply_size: u32,
+    ) -> impl Init<Self, Error> {
+        let init_inner = try_init!(r000_00::GMCAPI_HEADER {
+            command: GmcCommandWord::zeroed().with_id(command).into(),
+            size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
+            sequence,
+            __bindgen_anon_1: r000_00::GMCAPI_HEADER__bindgen_ty_1 {
+                request: r000_00::GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1 {
+                    max_response_size: max_reply_size,
+                },
+            },
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GmcApiHeader {
+            inner <- init_inner,
+        })
+    }
+
+    /// Returns the `command` word of the header.
+    pub(crate) fn command(&self) -> GmcCommandWord {
+        GmcCommandWord::from(self.inner.command)
+    }
+
+    /// Returns the sequence number of the message.
+    pub(crate) fn sequence(&self) -> u64 {
+        self.inner.sequence
+    }
+
+    /// Returns the size in bytes of the payload following the header.
+    pub(crate) fn payload_size(&self) -> usize {
+        num::u32_as_usize(self.inner.size)
+    }
+
+    /// Returns the `NV_STATUS` carried by a response to a command.
+    ///
+    /// Returns `Some` with the `NV_STATUS` code if the `response` flag of [`Self::command`] is set;
+    /// otherwise returns `None`.
+    pub(crate) fn status(&self) -> Option<u32> {
+        if self.command().is_response() {
+            // SAFETY: we just checked that the message is a response.
+            let status = unsafe { self.inner.__bindgen_anon_1.response.status };
+
+            Some(status)
+        } else {
+            None
+        }
+    }
+}
+
+// SAFETY: This struct only contains integer types, including inside its union, and a zero-sized
+// array. It has no padding.
+unsafe impl AsBytes for GmcApiHeader {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GmcApiHeader {}
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]

-- 
2.56.0

