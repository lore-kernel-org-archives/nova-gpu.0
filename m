Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948796;
	b=C55zH2mc/m1E/WHypihrPAdyuV6fxl+K2if5fDzkqjj8hoRwPRCC5kCm4TCa3SZOps+i
	 iJ0CmYUbFKs20sMB+cqBOdaliucqhyKox79Wt1v74rUVUgOdj4o1G/Ai75pDdZmqFsHuJ
	 rcPwz38xzbzXiGQv1ll3Rek6L1KXjVMfWxshEk7L5OC3sILUcgXTlcwK5LMMiTZDhp2g7
	 4bXz765a1H/1/Qdgg0fyOvX0d+QuHdA2aqPztAg/6pLI7cMXThgBZ7K+rEIse6dtIX8Q3
	 7280wLsm7VuJIUXAiIsAlHnghW8XXYTonYABpei48SW9JjzzjvTYUfvBJ6Upt0VUhzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948796;
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
	bh=TmwhMTB8FhRRGYD7Aw+MhHAhjbJNRMX0GcHJx+fhZSM=;
	b=ptzdpnjCZ7kGwrETd4Lu3gbkJVgQq7i/qO5uCPHa6uGExymHt9csYVc/tXWIe8MfLusf
	 kyAzIqWamM5FzQfME0yfSwB5nIh5Rp8DFB0xUjr3fKflfTEEtDazr6c4x7KGU77aaFjqe
	 JvcsxVHD+hX9n65mx079K70rEEfkgY55vJkHoabxQz+RbWbDNltPGs0eYqsMwznODx4Eq
	 PI1Uprm3MAX5BX2uOmEXShAMbt8mowhtyzTY4jF+8hBEnQTPcUTo+6UjkfQ6tV5EDsOCk
	 R70aiP+WXe+lEx/0Gz7U6J+uTuz247axkXEUrxOyf2X3c2lybxfv0xAlfVOj58J7fdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lEk91GPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E1606A330
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lEk91GPz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfV0im7FI2l2WrLdMnhAgSi7jU6r7LXyikDkgMIlmlza1vbkZ0Toou0ifTfQdOfWqnF0hXVEyuz6TO3mEa/9YyE/zgTJmPhP5Jwl/+Iy8jtN7Z9KzG8teUwLkA9iVjx/3Z0VbBOAHsbyZnTDzLFKOXGg9Ik4CbCkD1XmTkV7GmchuH+N6TdF7TdXFXR1W8MRSMvD1C12ki1mjeHyj9KpAWjnVQxKtA2i3fZrVb4MOTnZqX8lseObcYYdo9XYKjZBqLE1Tdrb9biYzkc2V2rts1R9Gnl0ZVbG1rvf2UAc1sYWbkD89P+KH4Zu1cTwL59WLyR67iuUVsifewqKa8jj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmwhMTB8FhRRGYD7Aw+MhHAhjbJNRMX0GcHJx+fhZSM=;
 b=Wy0ztV0Q+qvXyApvt3AIjXb4IVCccCTlgKzreT1RCwqHFxQ6QKw6cB5sOUi2UeZf/j+kOF1d5BlEUUX5fPyecb7aCH9oQOlBU8ujFLBdJNm8H8bYjICdiSboQeXCO/+ybCJe+90ItjVJZ3CbsZ99geloZA1GjC5VIvdoMFtqXHpYx10O9V6f+ZiIlBf+kgb9btU1vlO1A94xZiuXcKNVeo9huxA+nEcn3GaBrFdvdqpGt8Z4ElydxyAtlLya/z1uWAijz28JLocaAVVtCPk5Bw8LoRNUyQGCUCDCP+ru9RHzKCH8uo+4saEb6k2USQECYGop7EOqqFFmS8oanrrgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmwhMTB8FhRRGYD7Aw+MhHAhjbJNRMX0GcHJx+fhZSM=;
 b=lEk91GPz3ceEcsqEX3M0T3vlB+hrGx72r6fiCNKFFVOe2ZjZ2MOyexZgjh7Zf1rA76jRCf6KM/JQrFQwRF+X0q7P9uoZ85+4+si2vg7DDm9BSPyrlOkPjmVluzL0cEOIg8J2kwlio7azc2Jy+p5roSl5S/s29NDKlqysbGz+JmMoj8LaQAQ6Hxr9kBe55C4I1f/QX5p8f6Ke5vydDVjghf4qPKGWcZNR9rAXcJM9PhdXQF8q2l+RYmq1jXPjaKKd7mfloklMqrHyG+dIxezEZOcPBEjWHpYq1Z9U1CWpVkEnC0qfryrOgv1sBiWmnKjByXfUu1kKMpFRXR/nAMG9+Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:23 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:11 +0900
Subject: [PATCH v2 3/6] gpu: nova-core: gsp: cmdq: add the GMC send path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-3-e481ea2168ef@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 521a0a18-c411-4e9b-c585-08df3bd47797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|261022075727099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|6133799003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2W7+dUZXODMmSq8skNYlgbQW45+e/5AFTT16UOKtXQuDaMpDpQe4PidLZFGCHV/rpn3tY9LneMiYQ0cQsAcyCE6qbGmn97aVscZi/6HobMYONkIxTIp+c/DYLBZPGM2j4pp4FzmBYHu4Fo4lBXrThPrdGZAzPE6XJ/fBbplVZWLUh3VD1TAC8oIQb8oPWsrYMkRYYglp8r9SI/bw4SKXS8DKzw8kD8Q7cG0Y4rsChoK5FLP0U9P06S2ufsfz3tEd327zgcMq1qvgy02hM3yQhSTD4wJR3LTZXNX2uodsgHmuE2aEZ09lWeB7USL0p6s5FbJxhdOBMiqJEMSXCz+O156jKrtulHirIO3euA5sux00vbD9WaZ+YodxdmsPnVhyfx4ALX3vDk2aTfaxg73b8DBi14XRh0b2rp1JraRsFKxuhzQRQsLhBrJ+aN2SJVwYVI7tRM6a5bx+UnQCKrLD5b8yqfGI8fTxu3WmuK91d/it1TptmCGJBvC6p37IYAWVaff6psY0tvwlVRcLsJ4D/N35jjxqyvacRuXGkvhJh0E0BfyIfoKrgLugQ2CRHijMYsCY7nJSwcREHPVvAELhiIJdEvt675TnobS4EHw+fYxJ116X4laT1zdHlVt0zzrpsZ2KsaEoAiCk86pEed4wL9zltJQdewY6SJmMaxxxjOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(261022075727099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEN4YkgzZGlmQWJvbXh5enNLMkVCTlNPbmJVWmNMcndESy9heUNoNjcxWTZP?=
 =?utf-8?B?RThPWjgzRmZTTWpmUEwxcTVwOGRxSlhwU1VWRStUYXQwOSsvVEUvUTl1Y0RP?=
 =?utf-8?B?TTBMUGI5bHU4RVFQQjNXZkwzVHZ5eStsTXg5dk83enNXWkp6YVdDMGFRTllT?=
 =?utf-8?B?ME5EaTVwUm0zb3haZWVRc1Yxd0VvQTdub3dWNXIrT3p2Q3dBejRmWFpISEhh?=
 =?utf-8?B?N0FLd2Z1Y2lMUnp0TW5oQXllQVRjK0JUbms1bTY5VjgrLzVmakJYbW5TbTM3?=
 =?utf-8?B?VDkzTFZrWFRkcnpEcE93aXNPY2pYUVZTcmFBbm91cEVNL0VqK3pTMkp6cHdX?=
 =?utf-8?B?bWNMM2Y3TTFwckNNWXZhWDZmdW9mV2xhY21MQzEvc2dUZ3kzUldoOHlZcjBD?=
 =?utf-8?B?NWtiY28rb2Nnd3ZQdTFpbGl6NkpDK0dKQVBSUDdJYWtob3Y1UVQvaXNPYmY5?=
 =?utf-8?B?Z2ZVaStMSlRuT2FiMm53SXE0N1YrQVFIRnUwM2NOMjNIWnhrZk8vUE9BSDA3?=
 =?utf-8?B?M3NtWGpqcW5iOS9EblFHajJLMTY4M1V2MTJMS2RENit6Ykl4QVZLVmxxZE9F?=
 =?utf-8?B?RTlyUlRlM2kydDJGWWhLUkdnem1rTTJ3RzQrbkxqZ24yTWFKeWNXeDRVWFJm?=
 =?utf-8?B?TDRXeFBMbGlaQTNuTWIxbU9qNVFTaU9iSWNHYzJZbDAxZ3M2TzJPaHhsQWtz?=
 =?utf-8?B?MVJGM3lIUEMvckJyZVBhdzBKQU1vUHNjV24zK1NCSGVGd0IrbDRaZkFVbHZv?=
 =?utf-8?B?Z2xkaDgraFFnS1JuMm1UWEt3SzlPNThZeCtuZlg1VUJJOVNmQVVxOEpFUEZi?=
 =?utf-8?B?TS9udmZ6RDRzbWszUjdrWnczOWo5bkRIbWxpRlppWXF5VjdHZUU5ZktnNncw?=
 =?utf-8?B?ZDRjSEJFVFc4OVZSMHFyWkp5SHpDcklIVkZJa1l1SW03dGlsY2lOS0FFdnlk?=
 =?utf-8?B?NXpmalFWeGt5SDY0R3FOL2xqM05YM05JSUdmdER3aTkrUnh2a09qYkZUUUM2?=
 =?utf-8?B?ZEJCUUVBNnZDNnY5Zmhic0paUE9xTHB2c1NzOW45YlMyaEd6ckxFd2xZMWlh?=
 =?utf-8?B?cUptc0s1UVJQWlVNU256cDNPVldXTUQxcldGak0wb0dNVnlhK2Q1WTJEM21l?=
 =?utf-8?B?Ylpudy9rU2ZKUWhEdWRuVW9IZFFqUTZSOXU3dUx1L0ZWYXphWTB2ZUtrWWhQ?=
 =?utf-8?B?SmcyQ2NLdHFBQ1h4S2pUaWRxN0JHYnZVczVTS3BkTm5zdkJNN3RaM3NTZmli?=
 =?utf-8?B?YjZ5eWVaRUs1NDhaK2RmT2VXODNYTFRLVTNKd2lJOE8xUFAvWDZsb3VsV2h4?=
 =?utf-8?B?WXBVcmkvVDlJaUhJWDU3SldLbjFxVUZkcDFRcXFFZXdMNTVwcFljcFV2TnpQ?=
 =?utf-8?B?cTNUeDk0TlE4T1ZEOHI3OTdtTkVxRHd2cW9JdHVCaGtQVWJTRzZMcXVyQkJ0?=
 =?utf-8?B?R3M5L3lsUjdrckxvQzg1R3ZPV0pBNUZWcHNWdnpGbi9pSzhFNG42WlNSRWhI?=
 =?utf-8?B?T1YwUm12NVBhd20vcXh0bEVjOEI1Znc2c3hLMUNSOFBjc21kYURla2FMNlRh?=
 =?utf-8?B?SnI5cVZKU1drQ0J6UkEwTXlCVFF5NkQ3USthMzBaSW8vTmd4S1BHYzZPRDF1?=
 =?utf-8?B?T1Q5RElrVWsyK2YxTmRTb3l5NXN0cEJOYVZINmNrNjNHVCs4SkZKU2xXd2hm?=
 =?utf-8?B?eEdIc0JqakhxQk9YdExsWXByVWllWGpBTUp4MnN1UmN1QURRRUxaamdBU0lI?=
 =?utf-8?B?NCtKSVdFUDFJNU0wZGN5TGN2Rlk1QU9uNngwNkMySkJmdDNwZUk5WDlIMTlD?=
 =?utf-8?B?dXB0ZkpnTFM2c2QyNHBVNEE5dTI3cUhRVnlsMHloK1p2emhsSVh4bzI3N0V1?=
 =?utf-8?B?VUlpSG56RU1DUjh2YU95NW5wL0hRSmMyTDRPczFKc1hmSkh4R2FHTE5ZNHg4?=
 =?utf-8?B?QzJ2WmxJUC8zM1hjU3J2aFJmUGI1UHBqbmg1Z0VrbkYxcktkNEtZT2hiSVB6?=
 =?utf-8?B?YWpMSVJIeHRNWWJTQ200dFZSYm9PUUNtOWtpYm9aRC9MVTBHT0NmN2phaGJo?=
 =?utf-8?B?R0lXdU1VcUpzeWw1bm13cnVzNUpqcXZxMld4Yi8zQTV0RE9QNGJCUUV6WTJ3?=
 =?utf-8?B?U1dMZEtZM0FTanJ4ZmVmK2RWWDVoZGNqeVBOampzTW9pa1IxS1VPT3RSbjAv?=
 =?utf-8?B?RDZFbDBnZnpUVHVwOE1wZzZyUTRLSXdXZ0JJQS9nMGdldTNORTBjeDl3dmFp?=
 =?utf-8?B?VjVrRjJ1VzdMYkJ5bDZmVkF5ZVJDSG10V24wOUhBNWZFT2hWVlVsZUx0N2hu?=
 =?utf-8?B?QUNxMnZZRGhJdUJ4N1lhcjVEYUdVeWNWbmVOZmk1NjU3OStCdWVVQlpDRkJS?=
 =?utf-8?Q?HBJ8v1L1Gia7cmy0gSIF5DbzSXGy/fILTjHAOlE/OAbrf?=
X-MS-Exchange-AntiSpam-MessageData-1: 10TZC8AiEDg5jg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521a0a18-c411-4e9b-c585-08df3bd47797
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:23.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ELx99goFwu1g/vF0m7rsPYh9yc3PdGTmerJthaxkXrGF0OeABG+IQ0Od9ZGnnHcCHwymy9vbjJZIotxWfImJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

From: John Hubbard <jhubbard@nvidia.com>

The r000 boot protocol has the driver send GSP_INIT, the request that
carries the driver's configuration to GSP-RM, as a GMC (GPU Management
Controller) API command. GMC and RPC commands share the command queue
and its sequence counter. A GMC command always fits in one element, as
the GMC API has no continuation records.

Add the gmc sub-module of the command queue, sibling of rpc, with trait
and type definitions mirroring those of rpc to support sending GMC
messages.

The module has no user yet, and is built as dead code until the switch
to r000.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |   4 +
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 202 ++++++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 76f5dbf2561b..9dd11ac8952b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
+// The transport header of the r570 firmware carries no message type, so nothing can produce or
+// consume a GMC message before the switch to r000. Until then the module is built as dead code.
+#[expect(dead_code)]
+pub(super) mod gmc;
 pub(super) mod rpc;
 
 use core::mem;
diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
new file mode 100644
index 000000000000..f741de8288c5
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Support for the GMC (GPU Management Controller) API message type on the GSP command queue.
+
+use kernel::{
+    device,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::{
+    gsp::{
+        cmdq::{
+            Cmdq,
+            CmdqInner,
+            CommandElement,
+            GspCommand,
+            NoReply, //
+        },
+        fw::{
+            GmcApiHeader,
+            GmcCommandId,
+            GspMsgElement, //
+        },
+        GSP_PAGE_SIZE,
+    },
+    sbuffer::SBufferIter,
+};
+
+/// Trait implemented by types representing a GMC command to send to the GSP.
+///
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
+///
+/// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
+/// into the space reserved for it in the command queue buffer.
+///
+/// Some commands may be followed by a variable-length payload. For these, the
+/// [`CommandToGsp::variable_payload_len`] and [`CommandToGsp::init_variable_payload`] need to be
+/// defined as well.
+pub(crate) trait CommandToGsp {
+    /// Id identifying this command to the GSP.
+    const COMMAND: GmcCommandId;
+
+    /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer right
+    /// after the GMC API header.
+    type Command: FromBytes + AsBytes;
+
+    /// Type of the reply expected from the GSP, or [`NoReply`] for commands that don't have a
+    /// reply.
+    type Reply;
+
+    /// Largest reply this command accepts, in bytes. Zero for commands that the GSP does not
+    /// answer, or for commands that expect a reply with an empty payload (i.e. just a status
+    /// value).
+    const MAX_REPLY_SIZE: u32;
+
+    /// Error type returned by [`CommandToGsp::init`].
+    type InitError;
+
+    /// In-place command initializer responsible for filling the command in the command queue
+    /// buffer.
+    fn init(&self) -> impl Init<Self::Command, Self::InitError>;
+
+    /// Size of the variable-length payload following the command structure generated by
+    /// [`CommandToGsp::init`].
+    ///
+    /// Most commands don't have a variable-length payload, so this is zero by default.
+    fn variable_payload_len(&self) -> usize {
+        0
+    }
+
+    /// Method initializing the variable-length payload.
+    ///
+    /// The command buffer is circular, which means that we may need to jump back to its beginning
+    /// while in the middle of a command. For this reason, the variable-length payload is
+    /// initialized using a [`SBufferIter`].
+    ///
+    /// This method will receive a buffer of the length returned by
+    /// [`CommandToGsp::variable_payload_len`], and must write every single byte of it. Leaving
+    /// unwritten space will lead to an error.
+    ///
+    /// Most commands don't have a variable-length payload, so this does nothing by default.
+    fn init_variable_payload(
+        &self,
+        _dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Total size of the command (including its variable-length payload) without the GMC API
+    /// header, i.e. the payload size advertised by that header.
+    fn size(&self) -> usize {
+        size_of::<Self::Command>() + self.variable_payload_len()
+    }
+}
+
+/// Wrapper type for sending a GMC command as a command queue element.
+struct GmcCommandElement<C>(C);
+
+impl<C> CommandElement for GmcCommandElement<C>
+where
+    C: CommandToGsp,
+    Error: From<C::InitError>,
+{
+    fn size(&self) -> usize {
+        size_of::<GmcApiHeader>() + self.0.size()
+    }
+
+    fn write(&self, dev: &device::Device, seq: u32, dst: &mut GspCommand<'_>) -> Result {
+        // Ensure that the command and its headers are not larger than one page, which is part of
+        // the GMC API contract.
+        const_assert!(
+            size_of::<GspMsgElement>() + size_of::<GmcApiHeader>() + size_of::<C::Command>()
+                <= GSP_PAGE_SIZE
+        );
+
+        let command = &self.0;
+        let payload_size = command.size();
+        // Extract the areas for the GMC API header and the command itself. Per the `const_assert!`
+        // above, the GSP message header, the GMC API header and the command header together are
+        // guaranteed to fit entirely into a single page, so it's ok to only look at
+        // `dst.contents.0` here.
+        let (header, contents) = GmcApiHeader::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
+        let (cmd, payload_1) = C::Command::from_bytes_mut_prefix(contents).ok_or(EIO)?;
+        let header_init =
+            GmcApiHeader::init(C::COMMAND, u64::from(seq), payload_size, C::MAX_REPLY_SIZE);
+        // SAFETY: `header` is a valid reference, and is not touched if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(header), header_init)?;
+        }
+        // SAFETY: `cmd` is a valid reference, and is not touched if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(cmd), command.init())?;
+        }
+
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
+
+        if !sbuffer.is_empty() {
+            return Err(EIO);
+        }
+
+        dev_dbg!(
+            dev,
+            "GSP GMC: send: seq# {}, command={:?}, length=0x{:x}\n",
+            seq,
+            C::COMMAND,
+            payload_size,
+        );
+
+        Ok(())
+    }
+}
+
+impl Cmdq<'_> {
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializer are propagated as-is.
+    pub(crate) fn send_gmc_command_no_wait<C>(&self, command: C) -> Result
+    where
+        C: CommandToGsp<Reply = NoReply>,
+        Error: From<C::InitError>,
+    {
+        self.inner.lock().send_gmc_command(command).map(|_| ())
+    }
+}
+
+impl CmdqInner<'_> {
+    /// Sends `command` to the GSP, and returns the sequence number of its element.
+    ///
+    /// Unlike RPC commands, GMC commands are never split: a command that does not fit in a single
+    /// element is an error.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializer are propagated as-is.
+    fn send_gmc_command<C>(&mut self, command: C) -> Result<u32>
+    where
+        C: CommandToGsp,
+        Error: From<C::InitError>,
+    {
+        self.send_command_element(GmcCommandElement(command))
+    }
+}

-- 
2.56.0

