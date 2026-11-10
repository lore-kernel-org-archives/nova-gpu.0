Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306100;
	b=XEe/vGw0U/QWXV4ohxYzPVXVF+63AHe2gC9wGyakcgacOnquAWTb7y+B4TB0IieZBNx/
	 iU6sYof4tSOq3cc0odtfqdWFM3qX7kFLnLD/zPhiXV/uy3MgE0UiR3JL/n7NrI1CCxL2p
	 j7dj18XKVSkb/4kvVLv2hd9GXb2R7HV+sL3zFfow0zgX/H20Wkl7g3QOSB/O3BIF3UfT2
	 QGCMSIg39Upf1wsJzju6C7V/W+6vJesl+2Bh9fh5XD3RN468Ut38ztPjyDb5JzIRj8JFT
	 Es+8GRy2NWY1DYCdAx1ecrBIWW6mmeXcWmKs1Vnw5Qh/mMO09s6KFHm42mMFZcNrMrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306100;
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
	bh=0rhLePkJto4ZiuNJHxaHVvQk86F3qggby3ud3XMgIVM=;
	b=TkGmQGNsAb8v2rgcSIwPRk87CdXnKw8e0MLDvX9yAX69qhLCZTyivNhCbOjyEZ+5zi5o
	 nA0niiXnzpdDmZFXvYjrNJ1bzkh0LBZTQK3j1dz3hMMeoTW+Mh8FSngAHXcuESFL1ljbY
	 XS4YFquq0aJQCMln4t0JzXskj8ql0+58TPGHAeDpIFG99tGjXFZgwr6is5P96Ii89L/DH
	 T8xBpZU+wHGiQOtB6NK97xRM1AiIrJsT/PMmIKNlSICPir6pGwgSBgSqK7AM7xN3+byQk
	 yzX7CctE+F9FlQqtfJDmZTnt1tQex1sRHRBXi3L05CrZWK4VLeGMwYBDcAibeBmpsBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kxXi9WKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.50
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2160A261C
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A2160A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kxXi9WKs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iilS66z+HHmFjT3YTGsRPOkd4HMmnNVgHBce221qONy6YAEjpI2FsctP8JWRPE1ySWC5BtvroHOTIcV9tia3TQf5YHb6FaDBYIsVKcRxl2hqBY7uBxEEF3cBAvQViUck8QEUeJFMt36ouNNMmHeWE6eXTIV4ymMbyBNBOuvJyQ2iPTXy6xxOeA6xz6jp0qUYMyUNxhsHDyqV/5PJmxviY2PanQZnEuwWojcw2/jiRVScqEHiDKzIEdNpo5zPOlcNV7uOubbwqIUYDmz1DsbXbPdbrEgHDuTm1zliITjL+Hc2RBrGxpk+J3jKkm4Uekawn3UbZctL8LzwRlHxT/Z1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rhLePkJto4ZiuNJHxaHVvQk86F3qggby3ud3XMgIVM=;
 b=jn6Ur4TxdpWaMJevM+6PGNlA9IFxf7DB4DR0ZLA3YNe+VXP7myXGmmoZYaKX+Ce9la/q/pcdF2mOhG7AhdJOo37M8Kc08y05fYvmfDU752p6ottvR+gYVzHbcNsZrnB+76cw14BB9s0q1536l/lZGOdFyCXydaT+rdyjhMl9y0KMX/wZrKnrLHjZLi43XlR3J0PgvKjfqrElrEJ6sNEk7uNOfpKQeXwZZ0CHRWcdl3EOsJXRdkgKUzR7bIIvR1q9/yTmaOWIpgCh0Ntu+j0SHPHA5Pbq1vLIXEyzbbesr9B6UV/1F6EVprsmZtvTJZZ0bXb73lVQfEFuZ7FWh7LOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rhLePkJto4ZiuNJHxaHVvQk86F3qggby3ud3XMgIVM=;
 b=kxXi9WKsvq1erimZO2FKGyH3gZSE+/86WABEOmnWGV/VKD+qGWAnaG+TgwJsQ30xyWpVMdCjOuxr6G8q4otK4ZnBkv8cf6MWCBEQiB8mVaylC9IqYZvfE45CUIF/pFpjyK8iYLyHePxGn1no6i4Jahpm3RZgYK+3y9XMBU4QzJEk5ROWa+iNMGz6DqcA/VGtxf/IpX0t09KW+MYRx91sCQOBt9UF8EIam0FmBXc3nkrytrDc0rZxTDcdlYBzEIJ3iH5F+8To2fdYUupSeJXi47ncUM1wKQN91rxBUZuqru+jblBbRBxBBCirVVz012LiEBHi7192P4dtXIcVzcrH5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:36 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:59 +0900
Subject: [PATCH v3 10/13] gpu: nova-core: falcon: allow DMA transfers to
 read from a framebuffer address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-10-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: f55ff62b-8c21-4688-6d2a-08df3f1466c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DxVqwNlHIOMOJBFQg6jndFn50jX8bsNJq7NF602ZayfxDo++zRP3ZRi+FE4qqhwgaQkFIgargnTOpQq7pXTtcR/eqVNFfhTev1aJt36YoQCBgGEDF6Bdec/VownFG8kBqlhFQf/aGhqHOAIxdrYHs4LdcPvDvWFb87JNlrRzH1Fx+xc7U1G6YWJFSnRZATAMuGAiQf0jgkbp2yF7Jq/ewrPdgaXOPk0MS0GwcnTy5qKy7YjDP58PYf1JNMVmL8D0LbC4hKtPLXCLbt0cAuQhfz2FJ46Gy4++NllWSgz9bWP84OOdnVGVZ9z3u2WxSo+rzkfjLSq1cQirxdVpgfovvGERcNiEltAzmKfU5ghMSbVRp5LfU/b0i27p2QxO6Vm0QeVA1Lhtvu7f3/X/g4Br8+DoMCSYKLA7WIxryWmLTDoAbXB/5sELiTphnXgzb/pcCXOhrUBDM8x3fKbkp5q3en13qWfgO3VRO8UD3iGXx2HvDWITucT8HdCLjYlSdGUNt5Z+zXL3AhAIeNMo/l5SdHviA4jdAOKPniv9ChEPzz9SVOdk0O48WeE5HKLtmbVXNFN7HR/7Rm0irBliDDEH9U2Jk/dnYvHUi5uhb7x+9Pp7aCZRTHxGBjdOO1gvSzeUqEO7Af4blsFG+/wmJlZTlBHreSWT0qxUtcgp+KMVDj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxXZWwvblUzL3d2cjU2Uzk4TW93RWJZM21OS0FVUERvaDNNY05sVG9HYWVt?=
 =?utf-8?B?UFc2UmFiTDM1VjVQQW1KQmxvNG5Wa2ZvZzJ1eXBicmdsamtyUHhnZnY0NkVP?=
 =?utf-8?B?SmUrTE52ZURqS3JUam95YVQzb1FsL2JlWHpyRzdnNUUvQTgrQ3dLL01LNWZS?=
 =?utf-8?B?VzlYdlU5N3NhWFpPWDVCcjA0d0N1NFBFWjE4aWhlQ0RMSzkrU3RhcXVHekoz?=
 =?utf-8?B?WEkrSWhoMDl1RVJMK0lNZEUrZTY3ZE1kd0RhekhDNGJDSkhnZ0s0YWdBa2dK?=
 =?utf-8?B?MmtBSHRsd0ZwOG8vTGJnVlUrZUJaSjFNdUhKZG0ycGU3bFF1V09MenVPVzcx?=
 =?utf-8?B?SjdHaWYyOVhRKzBpbWR2S1dIQ0F4cTZPQlVYTG9CMXYvNFBOazNWdmJaRXZJ?=
 =?utf-8?B?Y05yY3NvTEdoeVg4anMyS2ZVZ3o5Nm5iNzhEaE1GMU90YmVGTGlnY2F5K0Q3?=
 =?utf-8?B?bW9qWEhYS1E4RElWOVJUYlhTTktXVTBpSTNOM3M4NFIxL3V2UUw0TmkzcHBa?=
 =?utf-8?B?cmszUmdpZUFESmVHaFhGUGdnRmF1RURUUGN5K3RCbk1mMlBBb0RGaWVjTUR5?=
 =?utf-8?B?ZXAybXI4c201dWRnMHNrRzFXQUpRdWFoRlQyUjgwc0xZcE9rUEc5UDJDNEcz?=
 =?utf-8?B?NWdrTHhpZ08vbCtVUUljSkZVMnZhNEhzcmx5NzVXd0Y1SGtwTHJLQlQ1eXNk?=
 =?utf-8?B?emZNcnJJTFhjQ0dyejZxRi90elhjZmpWYVhRWmV2N0tYRDkraU10Z2oycVNp?=
 =?utf-8?B?WEpORkZlV1VKUDlOZ1J4aTUwakxUcWZHVjArUWVkUFZDa3ZSRlVhQlVlMmM0?=
 =?utf-8?B?SXoxdDNnWG5WZnpIL3lsZmpjUkh1dHVPYTdvOHdNVkhtMVhpc0dwZXpsaDhu?=
 =?utf-8?B?SkszdG13NHZtTmVVckNLeFl2VWh1QU8wd3oyN0w1TCtod3IyYitQMU9BaWtW?=
 =?utf-8?B?VWJDQlpVUHR5c3lTUXh6S0xITi9xZG9vU0tkYSt1bzJRVTJQOEVtcXRmNjkx?=
 =?utf-8?B?MWthSjhNd1Y3SXU1eDVzRlArdldRQ2M0TEJUOFU4VE1GS3BCQTZDV1V3UG1T?=
 =?utf-8?B?TDR4c1NDK2VmTldQM3BvV0VkZW1ZWnozbXBhK2UyQXBqa2l4OHVXQzYyMzRv?=
 =?utf-8?B?ZzZhWEpQRERuVlhEQVZtVmRXR0F4b0ZqbWp3ZnF5V1puM0NvREg4aTNMN1F6?=
 =?utf-8?B?VlNyVTdXK1lCRWY0R3h2b1hFQld2eXpPRGRwOVR3aXg4bFlheEMxMStIT0RG?=
 =?utf-8?B?R3NHVE5WZXQwWFVmR2JTZzdVa0ZzUjgwckhhL1M3dnhCOWlHVnZ1L1BuMlp0?=
 =?utf-8?B?OWhveTNNNWhxckNPT3B1aFkwQ1NKTGNLKzlFRmFJU296aktBejVtMUJGMEFp?=
 =?utf-8?B?OStkMlpXWktaaTgydDRMN0lsNlpYQUx2MFZpRTFIa1Z6ZExGWGlmaHdaY1I5?=
 =?utf-8?B?UkRyb0pTMG9RQW1YcWpqYVJIRGl6QUhkQUo3OFpWa3RTQVVReVpwUFZuVDlj?=
 =?utf-8?B?ZzliMnpNaDJYclEyVytWTUE2d2VJT1h5SkhYRENBTDI5TEp2c0NzUXZMNzVV?=
 =?utf-8?B?WFJIU1NtMEE1eXplbm5xYzZVei95ajN3YVhVR0RsTCthK2p0aGpBUzJoRTlO?=
 =?utf-8?B?L3Zta01qNDFrYStNYy9sKzZaQlF0UDk5dnp0UllvYTJ0WHdjOXJ0RElGeURa?=
 =?utf-8?B?U0VKa1hyTkxybEpUY1dYRW9PNUFWYkpYeVNTOHEyMFJWYlRVREQrWll2VHhl?=
 =?utf-8?B?Y3lxWFkwc0p4Z1REMC9vSmJFNWh3MCtHT042SWt4aThJSm4rZjlleXZvSmpY?=
 =?utf-8?B?TDNCVXdsNnA3eDYydzQ4MmtFY3dpbmZGMUNTbjF3enlJcUJ6UnpEYXJiZG1V?=
 =?utf-8?B?R1pCQXhHbkpwb1NGY0Q4YkNYRWUzOWhPRndDc25uYzFZN3VQYStiN050K250?=
 =?utf-8?B?VWt6VDRENE1naS8xelZwZHF5ZXU1NGRFdG5pYUJsMzV3dXJBbnQ1QmxDcmVN?=
 =?utf-8?B?T1JWcXpjMFVYZ2RtWmdUM0NlYlE4Z1puRURYNTZDZEdZd1lEbmJqZEp2VTNu?=
 =?utf-8?B?WklKcEkrU2tRdkEyYXFSYVNUeit3UnZtZXl5Y0RZU05qdDVqUnYzL1NwQ1dw?=
 =?utf-8?B?a3Uxd2Z4RTZ1K2hsSlFFM3dhRGRWU3dEUlN3TjliUUdLVWM2VmJQNzNTTG85?=
 =?utf-8?B?Z1FhUEVNeDdNcjRUb2JJQUh1ajgxUkZyWUNWM1EzaDVxaTMxblhVdFUrNFY1?=
 =?utf-8?B?Umg1aGhMR2s1MG5PMFRZZU1yQks3K1JyTkk4clJzeVBySHVRaWZzdHh3THpy?=
 =?utf-8?B?YThRNldGNldMVDMySXp5d0ZoTzdFckRGRUZvUmdVRno4Q1lMVnkxZkNRN25U?=
 =?utf-8?Q?3PlyZ9z/lppmCqCD5tld2KNE5eMsPHtBKUdHV05tP7tBI?=
X-MS-Exchange-AntiSpam-MessageData-1: 99SeHmg8YNErgA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55ff62b-8c21-4688-6d2a-08df3f1466c4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:36.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3o8Q9+SGdhOki1v3zaykmhqdf3Tjc9bzsHOzC+YxgM5A/Iyt5f2exjskYgbf2YXAtvG6Y7U7++5XyowCWDxmWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

The r000 boot protocol has a load-and-execute event in which GSP-RM asks
the driver to load a Heavy-Secured binary from framebuffer memory into
the GSP falcon's memory by DMA in order to run it.

Nova-core's falcon DMA loading method currently only supports loading
from a DMA object that the driver has allocated, so there is no way to
copy an image from framebuffer memory that an event supplied.

Address this by making the source of a falcon DMA transfer an enum,
which can be either a DMA object, or a GPU framebuffer address.

The framebuffer address source has no user yet, but will be used by the
r000 boot protocol.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 45 +++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 04da14d48895..facf65a17c0f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -140,6 +140,15 @@ pub(crate) enum FalconMem {
     Dmem { tag: bool },
 }
 
+/// Where a falcon DMA transfer reads from.
+pub(crate) enum FalconDmaSource<'a> {
+    /// A DMA object in system memory.
+    Sysmem(&'a Coherent<'a, [u8]>),
+    /// GPU framebuffer memory at physical address `base`.
+    #[expect(dead_code)]
+    Framebuffer { base: u64 },
+}
+
 bounded_enum! {
     /// Defines the Framebuffer Interface (FBIF) aperture type.
     /// This determines the memory type for external memory access during a DMA transfer, which is
@@ -544,13 +553,10 @@ pub(crate) fn with_fbif_transcfg<R>(
         Ok(result)
     }
 
-    /// Perform a DMA write according to `load_offsets` from `dma_obj` into the falcon's
-    /// `target_mem`.
-    ///
-    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    /// Perform a DMA write according to `load_offsets` from `src` into the falcon's `target_mem`.
     fn dma_wr(
         &self,
-        dma_obj: &Coherent<'_, [u8]>,
+        src: FalconDmaSource<'_>,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
@@ -571,15 +577,20 @@ fn dma_wr(
             FalconMem::Dmem { tag: false } => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
 
-        let dma_base = {
-            // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
-            let end_offset = num_transfers
-                .checked_mul(DMA_LEN)
-                .and_then(|size| size.checked_add(load_offsets.src_start))
-                .map(usize::from_safe_cast)
-                .ok_or(EOVERFLOW)?;
+        let dma_base = match src {
+            FalconDmaSource::Sysmem(dma_obj) => {
+                // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
+                let end_offset = num_transfers
+                    .checked_mul(DMA_LEN)
+                    .and_then(|size| size.checked_add(load_offsets.src_start))
+                    .map(usize::from_safe_cast)
+                    .ok_or(EOVERFLOW)?;
 
-            io_project!(dma_obj, [try: base_offset..end_offset]).dma_address()
+                io_project!(dma_obj, [try: base_offset..end_offset]).dma_address()
+            }
+            FalconDmaSource::Framebuffer { base } => base
+                .checked_add(u64::from_safe_cast(base_offset))
+                .ok_or(EOVERFLOW)?,
         };
 
         if dma_base % DmaAddress::from(DMA_LEN) > 0 {
@@ -661,9 +672,13 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
                     .with_mem_type(FalconFbifMemType::Physical)
             });
 
-        self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
         self.dma_wr(
-            &dma_obj,
+            FalconDmaSource::Sysmem(&dma_obj),
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+        )?;
+        self.dma_wr(
+            FalconDmaSource::Sysmem(&dma_obj),
             FalconMem::Dmem { tag: false },
             fw.dmem_load_params(),
         )?;

-- 
2.56.0

