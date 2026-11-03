Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701391;
	b=YQ2RggN+eWH50cdkCleWu/Z7f05Tj4ot/VGyiF3lu5o7L1rZS9uscxZjvM5YMasAuZnL
	 b7Ce+bgLnhn6Po9VluxY06xQMzOtVUYjJGpHs65E+RMkbXPDBwbQnniK/pYiuMq28869g
	 C+C5EpFOllQ28Sm6KnI3ZZj4Rzjw49vPD7jcOegUpMjLBrZr7KaYaLgeuH1X2s0NF1wcd
	 xk/R421FZr1BCv0I8rceCgKLz+NtBcTjIj1Xpq3rGpqBZ4eRy2bJk6CMSpC/O7ny0ri9X
	 xkIwYaclLHZRFtkO3WhIavzdtk6pzLB8e8umnoutynwLmiqnr0qjhlmfsjtERc5JY6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701391;
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
	bh=efHJ8Ljho04EmFQ9aTe7E8p68ch616tIGNIIvcLgrDI=;
	b=zH2tpG2tlteGmtba6oRkNAClRlwR2z9UyuGfeYQFcJ9AMf344ycjrbmc6TOJu0dBG9pa
	 2fZAc73/eK91tgcIi4HKJdLP1WjS2NH3A7ADOkNi25R1TxdT9/GsFtGltCSmBbQTKtPJY
	 HOtKGfvxpibqRpS9E7Ubqylw0EkRxQJbV0TDERMIuM7GT3u784UHx/5AY7yz3sIvYj48h
	 EN9crLCaex1BV84QxQH7AVf/fiToOnJT2TjY1VuK7D5/l8mJHEReWnzhx0krfIk/NFrRS
	 tjWYYrSHmXj2BFXaOsqTzky4iTuWr2oqQUbw4i5wdTeoec2KD7aUJQyB4Yk8Wh/Nv3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lbqbuhlS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.62
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4F60A2639
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A4F60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lbqbuhlS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYrO/qWBvMQ7oGDQc6OISUSPQOTDcBpqaVRO3KNTYZ09i7lxhxlnOzjlW5zoW3hbCuAwBjK1rKPw8ll0n0AJKeoCRana7rOQelS4Oz4tULauyIasyZ5EVt9V5Xp15f5bHShj5UUXSsLMsPwDpdF2Fl7MQQmdVDJ/iKIiECpu6wR3ZdugNVJ9H6HS//A3FldCxJnX6nY0vsWaJOlqx1URz9ilkCUA099vtJ6muZC/erAfZxSx551BHqv/wA57AzL8wOKopuEXhp6Zg1XLRZsnBNnm8l7f58Sby4sUXkuzokNrI18yH+kRcwerSAH/FmHYsEiauLMThcyN0weLiHaapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efHJ8Ljho04EmFQ9aTe7E8p68ch616tIGNIIvcLgrDI=;
 b=LLtm8NtsXgNJHVFFbI1d+3KqE5vV8BSlLk1xV4Ar/P6G0PXwTGoBqs/cVAel3ESOMCxCgbfg+ukcKmn0ZORXnEmIfAJ9sakeaiF50NyS+j4D8Yi2GJ9J4xpzfN3H0iCiMmtqvFAuSLUmhHvVdgCyp2QAgBFln/VctUHj5JV1W45b/sIwxuxPZyhCQhOpaymq+u+vSyuVrGBPJQk8PTtBetEeTSISwNDZqf/7L1ToUJnaMqZluyxlc6fF58sYpK+0sogpyYE1FbESI7IWNQUq3k7CebzejtRhtJWHQoPznHumii6nkpexiE9LelbGfhJFXYVpZPRocktZateWT28/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efHJ8Ljho04EmFQ9aTe7E8p68ch616tIGNIIvcLgrDI=;
 b=lbqbuhlS5cXGJmxKgKU7iyAbhets9ok+OONpOmiS5Mb8pERq23QmVnPuLbgIPbwRvIpR5KagYHnG8GOU8DOI5vu1+D9zOKP6JTRmUIgFTV3ME8/ZJvBAjxH+4O76kIV+dPFOpywxg0Zev1PNDtGwejJz0vXLgyeWPcHfxw2WUP8bz/qRn0DfWlasMn81WWoB6Bb2IOvk4OW8d3eiSkDOtAoaHQDEhdu+ZRmeGa6z27to7SVMUaBaZTFbmh7eh1R6bTh5GGxt+gPCT6ysuguGgBB8GJFDrZehCAt136ETB0eyvtmj3gX0RNv2gy2Dzeglf0Jj3V2uQ2Q/dbRK9qxUyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:23:06 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:23:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:44 +0900
Subject: [PATCH 6/7] gpu: nova-core: falcon: allow DMA transfers to read
 from a framebuffer address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-6-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::11) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 071dd773-6b4d-4309-0fac-08df3994730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|261021123027099003|261022115727099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bCaM7AoEDCCEAeEkAqCGtiFM4QBVD+djDpIMsaOjpfaqg1YoCWxnnsu2DWrbMJjUr094BsvyJrewinP9Sja1a6cmFvrEXKl3LCc4KwK2EZy0EAT+8aPu16+Tg8alxNZwUeH47V5V6pJ0SrF25MgYul/mVKiamy5TydcfJ91N00O2eyaZTt8AqVMKCu3tv6nWxuGzPOSp+VtpUuvvESTObZCi85rJ9GVJuNaNLPydi+lcFp/niGjKvt3iIpZVNC7trlx4SSijVOQBshypoT9YVlBZQju3i2WD0lzzM1HCN9CmcJlQoBJ+CGHiUIpJkR98elcK7JyQyqCmM588z1ldJt45swKhRgohxmFr+m4Iy6XEyIuKNv1WStOpi9N+30ya9R0HOAbhgvpedALjsZXW4vQYewKY7MVW38MI5nzpd2daLYa5WUuaWfYFscK5xAnvZ1GKYgnZfXERhAfKIrmMdThBbbIvJXqLbX1ylP40S1itsoWhGxzbPsmE4Ha17FC0DJBPOO2Yl8B+xJkvF0SYvg2IvkXmck1vvW6GcjNS6Zfg9ovTxDTnB+zOBAqpulecAmrSBv6C5l27KLLsVWZyCAsuAuUT/LcXkJWkkATtxR/lh9W19QdC9jeBWoHgX/02niXgNrN2eosQowZG/pJvPnnnTusGCIvjMVrBMum+8tA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(261021123027099003)(261022115727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkUxbmY2RVlRM3c5YzZVbWFlcWJPTVEyR3JtWTZ4T0lnVlh2aWVuQ3FnZmZa?=
 =?utf-8?B?Nll6YzdNb1k0d0d5QmM2NFZFRk9pWmdodkJ1Yng2Ukx5TnJSN2dHanV6cTc5?=
 =?utf-8?B?dklud1hEWTJVQkdPMVlTbzVIV2lNTGtnNGFxMDdYUVRxaGRQcDJNRnBTL1d0?=
 =?utf-8?B?QXJFaFFRMS9aKzdxWEpUWTNqQk9PdzgwNE1nbEM4dXpLbXFPekVyYU1HdzFR?=
 =?utf-8?B?cVoyRHg1cTNVMmNNZG1MZVdSWHA1WVQvUnNRTnRaQ3FXWGs5c3lEVnhsckhp?=
 =?utf-8?B?a1g2YkRraFdKL0xnalIzOE4rR3kxMGRYZC82M0Q4L0QvTUxDWGhOOWVWaUFI?=
 =?utf-8?B?OVRqU29pZnhXTjRzZjFleDd0QUVEVk9CUXBvN1ArWkVZRk50WkFIOGRoNHJC?=
 =?utf-8?B?OFZnU1FWVHdEc0k2Qi9SVi93VHF6NDUrTWYyZVFsWVp3bC9oZU9NcWNMMWtX?=
 =?utf-8?B?RnhlZ2RZZ3U3MkhiMmVWL3BqRUJhOFdRWk92RkxnSHZKZ1c0MW5xdk5DdVBM?=
 =?utf-8?B?UGdhVW1YZ25UVlhQUEIwL3pWUUJJQkpscm9md3ZncFgra3FPdVBxVWtQUHlu?=
 =?utf-8?B?SnJPemlYT29RbkorOVE0S0FhZkhOSVc0dEI1SE9NS1A5QWJSTnpVUDQ2bU41?=
 =?utf-8?B?VUNCK3NJOW5OMTZSRDBZRVpJRGhNOEsxdGlMbmVKVFRIY3VtYzZIcjJXdksw?=
 =?utf-8?B?SUM1eVlSS05VMkgyK0ZENVBDS1dtUXNiT1k4RVNCVCs0NzU2MG5wdHBJT090?=
 =?utf-8?B?UFprWGZCcit1a21UWk0vMnUrU1BQNGV5VEpjTkIvTThzakpsOGNpV1hvTjh5?=
 =?utf-8?B?ek5BMG1UT2dFczhSVVdsZmZQRU95RTlobHFsVjUveHNtVlBwbWZvRGRSNmtR?=
 =?utf-8?B?cFFHSlFtMG5veTJhZXk4dkdZQWhRZzFiK0dhUmI0ZjRNNUNGeVJseWZYWVBk?=
 =?utf-8?B?LzNUL2J4Q3NOMnhNRGwxWituTjFyM3NPZ0VLc0YweFBBWWhkOGNyeC96THJK?=
 =?utf-8?B?OFQzZTNsZlRqZG1QOXR2WHN3QXNzUGtXRmRqTFVxZFVjZC9NY0Ztc3JLVmJX?=
 =?utf-8?B?aEJZTGoyYXQ0UTZJcVlRbXZPcVMyZXAyVS9vQ3plZEJaSjZqdUY2b0FyY0VN?=
 =?utf-8?B?NjBUalRmK3hYT016aXRncnVmS1NIZjBHaWJ2VzBWSUk0VnZHcGdCOTB0UFRS?=
 =?utf-8?B?bllwRkRXYjcwZG80U1BkQmM2cTBZanh3U3EyR1JLdXMvNFJ3RmREdXZvUXRq?=
 =?utf-8?B?ZG1lZDZrVmo0T0ZZRFNCRC8zMkJ2S0IwUmNCM0c2N2sySmFYbng5Rk1vaDMr?=
 =?utf-8?B?aXJsUGExdjhyVDlQU3ZrOXgzYW5iZUczY1BZZUxTSno4dDJPZHFTS2JWL3lG?=
 =?utf-8?B?eTVEdktIYjRYME1vY0xmSEJJWjRrL3AzR0lTZ1IvS3gxSWIrNlVFSWRkN2VJ?=
 =?utf-8?B?N05URlJmQVZGT2EwR003aWNUZGlpcFpDVjhwUFdJRkxyMmlGY1V0ZGl1Qllj?=
 =?utf-8?B?Z2R3VkJnbVFTVjJZUmhSYXN4STlpRytIKzM1TDBxU0pDWFdlbXhFL0dmRmJ6?=
 =?utf-8?B?a2MvZis3enM1czRvWDcrMHpoTHc5TDl2QXlXSW5yd0VMaXFmSHlTRy9vYnVL?=
 =?utf-8?B?dXpaUk84ZmZjbTM4TnI3aDNRbjNPOHFvekU4NDQ1eHpMMERBS2lPclJNZDli?=
 =?utf-8?B?SFQvTVFZZzk2MXF4WjFnbHA2c01rR3JRZnBpNEozTHJRT1JLWEJHaXowd3NM?=
 =?utf-8?B?NUJVRUZLdVMvZE91eXFxcmNYWnZlOVBORnFxS0xGaGZrcW9ER082eVhnMFdQ?=
 =?utf-8?B?WXVDRkJhaHcwZlFNQVZaTE0yOHgzR3UyZlU1Q3crUmM0anFIeXp6K1FSY2Jk?=
 =?utf-8?B?TTZTbGx3WG83OXZMQmx0aEMxd3dGeGJENk14ZTRSbE8zRjJwbmxIMkdKbTNN?=
 =?utf-8?B?ZzJTU05vODhQZEVaMXh4NHc2RHNxWjdYNzAvbGQ5WUxiektHYzZZZ0NUZVhq?=
 =?utf-8?B?VVNNdzVIYXo2ZDR2cUVhbWtYS2srSTNVcktJUlBPa1ZWOE9DU3ZKNnBiMVFu?=
 =?utf-8?B?YzhyV3BobFkyeG4yOENFL1NTSk11b3pnK0RZYzlWRnVvd2xsb1JmRXVJRmVS?=
 =?utf-8?B?RTFRMHBVcGo4S1RTTmQwRXF1Smx2YUhqKzl2dG5HSmFER3VBOGwzNDAyb2Rx?=
 =?utf-8?B?dHJzakZQdWY1bDlLekkrcEFtRU0ySGhQZWtHaitEVWVkUm5zdXZ5U04zcVRK?=
 =?utf-8?B?SVU1Vm9wQythQkpUQTNwa2pEYTcyRVNTUDRZRTR5TG1pLytwN0Y5cWlxWFUz?=
 =?utf-8?B?eVR5UEhJS0ZBZi8rbjRTZHBnZWVFaVA4QTk1UWNiYTk3Q2lUdHp3WW1FUTBF?=
 =?utf-8?Q?m395Tfz0kyCAxhe3bVj3PS+LHt2DdfZs3Jj/45qngSNdt?=
X-MS-Exchange-AntiSpam-MessageData-1: vn4gRGGZWJ0azw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071dd773-6b4d-4309-0fac-08df3994730b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:23:05.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ot+UQuj4KsiAD+aogOArKJTn6q8tmByboj8BH1lfR4ClJTqhupId5umUo31iobtU9VrnsfsZjNbYU6JIU+qfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

The r000 boot protocol has a load-and-execute event in which GSP-RM asks
the driver to load a Heavy-Secured binary from framebuffer memory into
the GSP falcon's memory by DMA in order to run it.

Nova-core's falcon DMA loading method currently only supports loading
from a DMA object that the driver had allocated, so there is no way to
copy an image from framebuffer memory that an event supplied.

Address this by making the source of a falcon DMA transfer an enum,
which can be either a DMA object, or a GPU framebuffer address.

The framebuffer address source has no user yet, but will be used by the
r000 boot protocol.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 65 +++++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index f48f2eabab0f..fb43d0ed2821 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -136,6 +136,15 @@ pub(crate) enum FalconMem {
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
@@ -510,13 +519,11 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
         Ok(())
     }
 
-    /// Perform a DMA write according to `load_offsets` from `dma_obj` into the falcon's
+    /// Perform a DMA write according to `load_offsets` from `src` into the falcon's
     /// `target_mem`.
-    ///
-    /// `sec` is set if the loaded firmware is expected to run in secure mode.
     fn dma_wr(
         &self,
-        dma_obj: &Coherent<'_, [u8]>,
+        src: FalconDmaSource<'_>,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
@@ -529,21 +536,37 @@ fn dma_wr(
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM, the start offset is folded into the DMA address.
-        let (src_start, dma_start, tag_dmem) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0, false),
-            FalconMem::Dmem { tag } => (0, usize::from_safe_cast(load_offsets.src_start), tag),
-        };
+        // For DMEM in a DMA object, the start offset is folded into the DMA address. For DMEM at a
+        // framebuffer address, the DMA engine adds it to the address.
+        let (src_start, dma_address, tag_dmem) = match src {
+            FalconDmaSource::Sysmem(dma_obj) => {
+                let (src_start, dma_start, tag_dmem) = match target_mem {
+                    FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                        (load_offsets.src_start, 0, false)
+                    }
+                    FalconMem::Dmem { tag } => {
+                        (0, usize::from_safe_cast(load_offsets.src_start), tag)
+                    }
+                };
 
-        let dma_address = {
-            // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
-            let dma_end = num_transfers
-                .checked_mul(DMA_LEN)
-                .and_then(|size| size.checked_add(load_offsets.src_start))
-                .map(usize::from_safe_cast)
-                .ok_or(EOVERFLOW)?;
+                // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
+                let dma_end = num_transfers
+                    .checked_mul(DMA_LEN)
+                    .and_then(|size| size.checked_add(load_offsets.src_start))
+                    .map(usize::from_safe_cast)
+                    .ok_or(EOVERFLOW)?;
 
-            io_project!(dma_obj, [try: dma_start..dma_end]).dma_address()
+                (
+                    src_start,
+                    io_project!(dma_obj, [try: dma_start..dma_end]).dma_address(),
+                    tag_dmem,
+                )
+            }
+            FalconDmaSource::Framebuffer { base } => (
+                load_offsets.src_start,
+                base,
+                matches!(target_mem, FalconMem::Dmem { tag: true }),
+            ),
         };
 
         if dma_address % DmaAddress::from(DMA_LEN) > 0 {
@@ -626,9 +649,13 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
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

