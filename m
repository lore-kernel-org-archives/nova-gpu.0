Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701372;
	b=qDwEmAkArfPWRfO83Hv11bnBCfExTAS2Gbo/k4rmcXEzL8LIFQJPARJiQ087+TKs2Hoq
	 M0DxR2TkGwlKJXVgQDuiRuaSnNYCkSdCSUBUu2QMmVGEVjLl8l9Fm9HjEWjPEgSWOY77v
	 cexvu87wh10RXgntjwFllE+5bYbIL1vug5rkXUoivjrgijF/fLO7tKZLuSRkBZ8PliSii
	 XVUzUNMwskZ5xjOp3YWtcp9R92zJCJ2Rd0v4bo+0zjADGFkW9CvFMweYRswvVkW90sFkk
	 KxiFj4OCfYdhRSDuIac6/Ldbobisfj+f9mHL2t3WNLYgtRPfMMwcUd1MClhB36l27QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701372;
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
	bh=xvf0+nqmtlK1+3bpi548XBQ7asgxtrWap46UZiDU0ZM=;
	b=TLvA1sOpMilmH59mQqmMBqjIwp7Sao2xkIyb/ZjmiCJaAKyKTNjuPd5emOB34uXEV0m0
	 HWLObPlKeAHa6lujQNbtB1sA3XuBhxPZjBLDTZOBxTiwJAomfa8SUnKK1FOyt2+02Kq4V
	 Uu7NfPvW3O7QQrj55VtkJ+1fq29HkN1Y8oAErPzf3f/1O5oSht1GndCcw8idyt5Z/ba4L
	 Of8TxUHhr2sl+RsQbzbLrpMV/YPHEPJeg8EsdPBeGLSr86erdclL5hLgppopd2egxW3X9
	 1qii/O6Chk5M6liNrLNochVmbZ0a/DAo+jLT8620i2KC64/k+p+iP81FFxYa6/qGP9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sj4VEzz6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890A606A337
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B890A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sj4VEzz6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6Se8HUWDpw/XT3cMQVqoVMW42ytXUj7BGPFawyx2sKBIMbXzX0aMplUHq4wlLT5gIafvWc9KPYyFZQx4FoXlMGfemIQ0pV7w/qH6lu8tqA4Qamg7rULHH+Sui9zNA4aVdTAjOB5Apv5zmfe5EH+ZFYIlS+jFUARlSCZTS1L/nMiKASI1N6k/GaJWThNrWn0mxXU2ABWm4Ged+H3kFPZmz6ry1tYmvS2PET5tnIxSoBgBUT4/Y+BZ+c9UVDXmXYwBr6HoMRHl3PLy2kshsvNrKQwHNX+fG5L8qjxVVkYaVgMURfGX1W/We4o/RHfy7mwMtmucNxuQn1i2UyezmY53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvf0+nqmtlK1+3bpi548XBQ7asgxtrWap46UZiDU0ZM=;
 b=NHGfwfdmCVuieXLWu8KYysVKBzw2N91dmk2CAZ1P078RiILblU8BYALLX6BXIDx62ZzDHj6kVwNCSVHIpHbsTT3PtRXo8zTfB0JlRMWel4ZJtx6AsqQPM+E0E+sMjrzIOP+Mlgnr0b1i45OBVLNg2IhI6nuzKzGltCiiJQOl0rmCwWd4T2bhDjOB4cZQlF4WkMvQw1U0xK6zHPBekj+m/wRayPCUxLmFADZHsu28FkRI+hbNxnMI8Jg19bwSLQfzYKfirzYsVI3JXfEySJKvqTjgbX4GIQLR8uuIy4RQSRH0N03taIfyhXiUHHTTyv3DzJfcFseHB7VBtX54m9sqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvf0+nqmtlK1+3bpi548XBQ7asgxtrWap46UZiDU0ZM=;
 b=sj4VEzz6Q+Xn9I/6kjSam2ke3xz/qdlN4XyhBu7z9R04IkrB0GxFmRHAPCNAqi3XQ/CzXnxPiYShgLD4VKGz+70TdmNAlq7JABhXXq+mjDzPbHFTOUTWOCUyk4W7JZWiPkMM9cShIMES7UAcWaeXnTisgXYDmnStdEQyNecI0KPWwUycLT9bTyr7JJ4gHV14kxoh26DJcyeGRabIq2fq0/r+zue9jJtUmjEYaX5b8aQl2sCLqrXpfqotlzVSJ6eG+AJPCwewnARGUrG3JltYL967urbHJCtT7F0dgJLpk1vH2jfbxPY/Na0B9jEDliJpexFqGPJXyB9AEf5B9ZzSwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:47 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:22:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/7] gpu: nova-core: generic bootloader and falcon DMA
 changes for r000
Date: Tue, 03 Nov 2026 19:22:38 +0900
Message-Id: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3SIDAwPdtHJdAwuLFGPLRDMT4yRzJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAGDz9OxrAAAA
X-Change-ID: 20261103-r000-fw-088d39a643b7
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ad4134-75ea-4bc8-a9c9-08df39946815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|261021123027099003|261022115727099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261102130727099003|261026140227099003|261026121527099003|261028144727099003|11063799006|56012099006|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PZ6nz+48r7r7L4/wrRk4jNkMefIlHcihRtQkgEV4tnzhHyZnH1tfLQP2lXOA1yQWUnRUEs3SM1e9loiDI2YWUXd5FqqZBXfNz7oGhZwo66pBP1yxzpy9wmWKlvJqCUVKEDVLnn6uuEwQUFyC+IVBqs49aS1uaIQBLwoymf3/Fo/wXf0hooBl+tYNO6VufhQHDF/kXTtmtjex+phD94Q09Nz7J9WJujKUiEb5UCHXcpl3noj93bTlMRz9J0+pUyjGq5ayBWUd2Czng0d9U0K2scTljmugOMn7IOOSwOaaK8Q9Z4QGqy4xtlFedZOFnb25kUlTQTQv6c3hlKNc2NOCYVPE0YZ3Gs1DSF0yzNKOmcxJoBey1ngrPPh3uhv3r/E5pp+cIqCbyWVolVXcPlTZLcYK9d0CzAbY5YWGPr+Sg70JByLhb+GBQUB7eADLHeWBjVIrfsXBsLBl3IUbNA623+Vjh+g/qDUBjC5MRi91tMumVDcpZ8sohmbsE3dngnCNaz8nOuRkROPhvKS2BQYsu69wAw0ANy8fgOrsBpQJMxDB6GG0ZVhmU1jwG1OVRyoC8crP5mAcJQVmWFO4Fvmu1zVPpdTH2ThbA8KHaNu5Zii/TJm5BF457XzjmhK+IMJCJL4rdeMpri6ZMwnHJ1i1TP+n6C6/mKytW60BkP7rqi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(261021123027099003)(261022115727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261102130727099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFlxMDN1eDNnU1o5bWs5anYxZldaU1lrcEM1QUVHZjlucjhUZ2ZkR2lKU0pE?=
 =?utf-8?B?dWZncGlSdVI0b21Gayt0ZjN1VVNYVmF5bWhIZGJNcHVOWEJHWXkyeVI5d3VX?=
 =?utf-8?B?ZmNEcGNrWVJOQXlQYWhGUTBvNDc3T0RYU3l0R1hwV3BHNi9MRVNBemliRXhl?=
 =?utf-8?B?d1hVanFIMUdhUnpxTE9mdC9YRWgrZVJpZVNCMUJZYzJOSWhCd01xWHZuN215?=
 =?utf-8?B?RVRWdU5sblQvMG8wNDdxbGhEY05CZ0czSjdTZSthZDdVVmx6RkNqMjJWTjV2?=
 =?utf-8?B?MWpSSWtwbjU3RUozTzVaNk5UaWF3UUx4N2VuRkZNUU5BL1FWc1JjQlNsalBi?=
 =?utf-8?B?T0Uzd2hmVC9JNUZOdXdZZ056dXk1S1JXdXp2VDdjYnIxcWVzQlpQNXdRRC9y?=
 =?utf-8?B?YnRWS3FUMW1IUGgvRE85UlgwckNEUUdSVVFyamRiQ0p3WE0vQ2xUS1MwRndX?=
 =?utf-8?B?aEVXWkVnZkJHQnE4dHNuaWROb2E3VHpXaVFvSUltODRqMlJmbm0zWk5PaVl2?=
 =?utf-8?B?N3BobE5Zc0tyT2E1eFZkSkUwOU50TGpxTWtlYmVEaGU2K1llY0JNcmh1RHhq?=
 =?utf-8?B?L1J4TFFCQ1dySkN5TnphYzlVbTZ4aG9uWEd5eGxVbjkyYUgvL2dRV1p5SGJ5?=
 =?utf-8?B?Q1puU2tSdTNFcks3U3dBVm03b2d4Z1N2UExmQ3RXcFNIMExEOCs3cDVJbURk?=
 =?utf-8?B?Qk9KYVVqZ1lNN21NSVBsWDhCTm5NTS9xMXpJTFFBWXFkbThCRmh5Ny9rY1dH?=
 =?utf-8?B?Y0wrWG5XNkM5SVB1SU5BVXBscjdOUG5WZWFuYWFNc1haMXhHQ0MrZWtHQzk1?=
 =?utf-8?B?SU4rZVd1OU94MnlkUEU1Q3YxbHljRHY0SUl2NVhEcGtta1N1RWt1QmdzNjdr?=
 =?utf-8?B?QTdrWXBDbDdqUVQ2RHlUYS9QVFkwTzNwQVlBbFVlS2QzT0N6cUk2SDVVd2pT?=
 =?utf-8?B?NGZ6RlYyL0E0K2tzdi9PNjd2ZDVERzVFVmlKWlVuSS9TUk9MTUtqNHZMdU96?=
 =?utf-8?B?ZjFZVGQ1N2RKaXRSSk9pQ1haeFVPTG9MVjcraHpXbjQ0L1FtMVoyaUV4QmU3?=
 =?utf-8?B?ZVgzWEloZkNLRjlMTmsrNUZ5MUZhbXRkQ3ZPaVIvaWtRYjhrOWcvbHFaSFpw?=
 =?utf-8?B?YWw1MkZBNW9aQ1VBN3VKSytxZDl1MGp1V2RhR3dqb1pyOUlJclBya0c4MXA3?=
 =?utf-8?B?akNYbzVXMEpXYUJhcmZRd3BFSTdnVjh4S0NXV3dvN0o5WG5BM3hXYjZ1dEN6?=
 =?utf-8?B?UHc3OTJ5RDE5NndlSlFLL1hMaUg0L3kwNVozRjVKWFpBUE53SFY3V3pqZm1P?=
 =?utf-8?B?TCtxMkYvaVRpdEJnNWttWTJ3eWF1VUNlK0tnY1A0aHlmYXR2QU8vemcwblg3?=
 =?utf-8?B?TUoveUJOMlhXYzFMN0dLQ0x2NmNhY1FZbVhRREMyN09ZNUJGVHNYemRXdTVP?=
 =?utf-8?B?anJLZElvVSttc0xIN1VtWjIxVEVXSTZNRVpUNDBoN2llWWFZOEU3Z3hVY1Qv?=
 =?utf-8?B?aGtSY21DM1R6NHA0eFFXOUM1ZmxtaXFJdlp3b2VHNjF0ZlMxYmI3andDa1Zm?=
 =?utf-8?B?ellJcFVtRkU0NU9iU1VJemQ3UFdTQ2xnWWRVTWdycFgrT2g0aWUyVU9Iems0?=
 =?utf-8?B?RGh4RjFkMUFwTEN1QmY5SGlzdmRUUzVyYnpySDlpRUg3cHcyOUk1dDgyR0JB?=
 =?utf-8?B?TUl0MjR1K0FSYjQ1a2dEUVZ0U0ZDRHdBdktBRThSbnI5aGorb29LMEpQMk01?=
 =?utf-8?B?M3M4UDZEeFZRTGp2VCtiQ0Y1WEN6ZUFCUlNqTVBsMVFyU2JIaDB1VkkzNm5l?=
 =?utf-8?B?bzJ2L05YQjNBU0tFaUtxdXZBUkptWFhSdkdPcTRqMFZSMFVCL1hTajNxN0k5?=
 =?utf-8?B?WjZjeWtIRmdtb25lSWsxNVNQL0RlQUVCMEhvdUs4S0ZLQmJlTmgvTUVWNUhr?=
 =?utf-8?B?Qkp3RkdEdmdVRnJnR2VzOGVBNkdGZ000cVkrVHAvMlViSllTMTA5MUI3YTZN?=
 =?utf-8?B?UDB3bzBYeml3SHB6RUp4K1F0dVd3emp1ck5jNXk2R3RUcFljaW5jZW56Y3hP?=
 =?utf-8?B?VS9aQ2ZhVitVdE94eElTR29tbTc0dUZUcmNza3lMbkFycGJRcGF2aThyNUlD?=
 =?utf-8?B?SHFBTUo5a2FQbFZPK3RxUFNwRkZlREtOR1I2NTNJZVdpdmpscXhpbCtzK0lo?=
 =?utf-8?B?ckc4QTZPZU9IZkYwbVVmaWNQM2tJNGVXTDFjYlZZNVZSOFZ5anJjemdYRkRr?=
 =?utf-8?B?c0ZDOUQwNWszVWJEVGpaWE9tWTFJM2N4ZWd6RGEyS25HUkk3bUE0bVQ5Vms1?=
 =?utf-8?B?YUE0TjBDMVhxMzNFeHVxOTI1UW0zNmNvMnpSQlFtbWt0dG55SmRwd3c2ZzRu?=
 =?utf-8?Q?M7hS31rRV7hDepEGhlznBG6kQPYUEgvj+mNpoxx3L27ax?=
X-MS-Exchange-AntiSpam-MessageData-1: 9Ks7cbs06sOEOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ad4134-75ea-4bc8-a9c9-08df39946815
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:47.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dIEd7lzpWWPxHz7tyhO4QoLjf4zG782z4xVGNkphw8iDiY0UYJi/UlvN3gul/1iUrDTuQTXxLGZTtf6TLLgUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

This series contains patches 13, 14, 16 and 17 from John's r000 series
v3 [1], that prepare the generic falcon bootloader and the falcon DMA
code for the r000 boot protocol. They are submitted separately as they
do not depend on the command queue work, and are valuable on their own.

Patches 1 to 4 make the generic bootloader its own type, usable with any
DMEM descriptor and not just FWSEC's, and place it at the top of IMEM as
reported by the HWCFG register instead of assuming a 64 KiB IMEM.
Patches 5 to 7 let falcon DMA transfers read from a framebuffer address
and tag DMEM blocks, and check the per-block offsets for overflow. These
three are extracted from a single commit into their own patches.

Apart from the bootloader placement, no functional change is introduced
by this series. The new DMA capabilities remain unused until the r000
load-and-execute handlers land.

Based on `drm-rust-next`, tested with TU106 and GA107 using both the
570.144 and 615.71.09 firmware images.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes since John's v3:
- Split the IMEM placement change out of the bootloader extraction.
- Keep the DMEM descriptor fields private behind a constructor.
- Replace the exported bootloader pairing type with a `run()` method.
- Make `dma_wr()` able to work with different sources instead of adding
  a second DMA method.
- Split the DMEM tagging and overflow checks into their own patches.

---
Alexandre Courbot (2):
      gpu: nova-core: falcon: allow DMEM DMA transfers to request tagging
      gpu: nova-core: falcon: allow DMA transfers to read from a framebuffer address

John Hubbard (5):
      gpu: nova-core: separate the generic falcon bootloader from FWSEC
      gpu: nova-core: place the generic bootloader at the top of IMEM
      gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
      gpu: nova-core: run the generic bootloader from its own type
      gpu: nova-core: falcon: check the per-block DMA offsets for overflow

 drivers/gpu/nova-core/falcon.rs                    |  89 +++++--
 drivers/gpu/nova-core/firmware.rs                  |   1 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 202 +++------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 270 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |   6 +-
 drivers/gpu/nova-core/regs.rs                      |   7 +-
 6 files changed, 375 insertions(+), 200 deletions(-)
---
base-commit: 1c221646e5e5f8a1d2f29cc8250b5785433bda37
change-id: 20261103-r000-fw-088d39a643b7

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

