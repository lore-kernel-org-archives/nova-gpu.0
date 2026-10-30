Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793330505;
	b=n3sLwo48xSwg4DDAp/PpuwyAGSqJqJARWkDi9VaWIpvWcDE/r2+jsX4rA4QCB4JQ9nAU
	 5wK4Qe9wQUehcatsQsx9b/xUZwOv1Af38u/QgE5KtgNkPyXhywrab9AGa1TFuCghswhRX
	 NBAoRzUjDpWfqqpntMHibV+FczTz+Sts7jtG/NvBqGfOagoCrMGLBpKwG+FrgI8q67UgY
	 TMSQo2eFFI3MeTB5tw5sWl/JTcLznw3MtPu4FsiFRw3hCTJwsskFUnDG6dPXYMg/shLYf
	 0SAv0Wn3XdQp9w4+rthiuxnSFnRqV5Xibbv8sRRsBOkBOsff+VQz3eA5xrq+RXoaIOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330505;
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
	bh=OoXCWfv1sud738r+0Ax5IJBOTy8xHixMfBlNRBzB8Wo=;
	b=pNxsAc/2UyqIkKDx/tZQE4TspnlZCa591AEb5PtZHRSV+76SaP8ti9p/cYeZNoC15jB1
	 UKnPaNbPMRZp73k6ry4J8hraWpXDI/Hk0l06ruh6X6Q1JbaLRuWTJMZwAUVeqYWOLZfaf
	 935HVUWNGAYuEU8eKa6VCXD+kyKmRKG6Ih17xdI35pfAqp8i3CrnGymDTtX4ZEncWtSsD
	 sqComea1EQKaLwCjmBn+bZqvmiIO6JoR+pKlZuitS3Fli+f+0RFDk3bA+LQq7GV831MVU
	 Y/lK6sn/uBRQuQAr9WkErur07+KqIQSbCDhFHpbqY+TcQqrWkMcBRgNCiYms0VnlHIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l3KUg1GJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.31
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71707606A31F
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 03:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71707606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l3KUg1GJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5jEmCCVr5TvL8X5Yai5/aW1p4VZSeYGv6JFyHC+5031168lH6JK2djpu9GKrYVD33tRVcokq0gRwdLDTjHgIF279b5zImUQwj/K7I/EIMVETrom8BlWZg50XW+g7lBmI4UCLWMUoSObJsBsbcZbQdjdHNA/jfqwqOtap1Ak9v9eg8w6ntNH2xMJ0stk8GL3PmjguN+1dBLlswz5cldiv4FQ2vTtni6xNR0cvNk9Sejl3Cqq3L3TzdyY/2nFCaaK5w1GaF7q+orfvQoDXIY8gktUJKXcAGLGiCkh8EBsezkM0zAKUXRq/U8ihp2K+RpyNnPtKIhNr6sn+1tc5sGRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoXCWfv1sud738r+0Ax5IJBOTy8xHixMfBlNRBzB8Wo=;
 b=LW9t8ov926u7qVimck8zH7VvOX+imKKQMtTxuK1CrtEGCKa9h/yL5BJUTZUpLwLwnsKnnJjV0fEn3k+mic/5UxULVCbQsIgpNZoNXV4dufqoJeSM/zw/lq48MqfaWfnUa96XLrdsK0jTpjYXizAqV2nuhIUo29kc1mnATzdLa3sQwUvdnLDgaILPKP/i7QGezOtY7vWN2g62bH/WxEG2YvgR5opkhd5gCjyFWGSaoHszGrFIuodp4bcEXZ/Lx7AD5jpvRqSP1co4TvGp5JqTzc1eoZHYrcAeI7kjeFJ5gCuSSSb5tB/pk2ETd98c8TZ9rJp/GMlziMFUeGRrSjQImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoXCWfv1sud738r+0Ax5IJBOTy8xHixMfBlNRBzB8Wo=;
 b=l3KUg1GJSiwXlDarzew7GLnP3ehEPHi7hUoLHoDfyigS9zRpHOxNupvmbxCCCqkJ7BKGRsPwYi5YuJzITL7G6k16cmEeu0HJ9yLi9idaleXF6pauW87BFL49LxiL6b6ldTuqqJ4EsdbhNAyoK6Nq5JnQVtNri98e8yMUljnzK3XAmKXJd8ukm2pjHJ+79NEIo3psf1he+mzQJdZzupleFPAHUO5+9Q/dJhdXeSKpcChfZAl0NDfltFVxY7DquDARi11wzbCtC0vLkw4qFL89/aambAU80AMyU9Dx0pn0Wr+avzc82Sda2ACJGX35Za9GrOh0gCljZaTDu5vJJE8Ehg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 03:21:41 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 03:21:41 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 30 Oct 2026 12:21:34 +0900
Subject: [PATCH] gpu: nova-core: gsp: cmdq: do not sleep in wait_for_msg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrBvIRHHRqxQJmox2ClGbiT8g3
 t3YLr/FewcIRSaBZ3FApJWFpzEDHwW4dzsOpNhng9GmRl1q5YL/2q3lZIMMNnGgaUnK1L5HNGX
 lUUNu50g977/vq/lblu5DLt0zOM8L9wE0ZHkAAAA=
X-Change-ID: 20261030-cmdq_wait_msg_timeout-26df11234d10
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:604:250::6) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dab8209-324d-44fd-0960-08df3634ea7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|261026121527099003|261009223027099003|11063799006|56012099006|261022105027099003|261022115727099003|10067099003|261021121427099003|261021123027099003|18002099003|3023799007|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	CB9guY8OfsgSnlPYTDMmONAUh+DmfgY8jpiHVLmeXwAyCLZu816bPn18Iu2YM643GMOXsFzuRoT2Hd7QYHz4T99WIcLSud8lxpbiIzPI3a5/X4EJWsXKkqqDHbRNObEjUNjcpdBNQiCddOxQM576gUbpJ3qw3wdM6yuRKenA0Kr4XmBbggy1DB4hrRkXC8Z+fhSxXoN77VgIKGhX52+stUzqwhLadhk/TsSi/54ZnHOROInYss7p2EqHpsBPCIIl37EZ4kB1BLCJItFknsS6VJoZ7co0cYJ9FUtm4igX/fdc+mzS8MnU+OG16we3XbWR1qr1UrHJ1qY4kzD8DKSWEwpH3O+2r+g+4Hkgji1tO1QhWepU7kPpZVDqh41uCOaHyLfARyt+Z6CdpflqJ3//uvIxLvCs64azXxe42phh5Vu+zrzjcE4+CxZtI1pGT6rGbL263cE+V4lCHwT6XX2Ec0ze/VmyCLLMFa6mI3sR6M1+cWJls5TPpno85I75QCKQBDSKSz05ebDRtwmLZEOYmACT7y6k/1ixdHQpI5XAJCGUaAtMnW7sBrYw5SfiyQ3sM6WejSlegTgO4YaOGuM5vsyMymXcr7dHvpwvB/ebEpe707UqMF7xbrB3FIPv+f2ValH0JY9UgJW3uxT5yEWm622XtB1NruHvqzfFSUHOhmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(261026121527099003)(261009223027099003)(11063799006)(56012099006)(261022105027099003)(261022115727099003)(10067099003)(261021121427099003)(261021123027099003)(18002099003)(3023799007)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXFkZG1sUERuUnZQTmJwWmFQaDhZaXZOZXVubmxPekxPc1JOa1RDRzlmRVRO?=
 =?utf-8?B?L1ZEQkZsSVY4TVZ5MWJkRmx2QWZrOWZsZWhUZEFLRFZFU05PVG8xMGNtVzRW?=
 =?utf-8?B?eG9rT0oxSUhQUXpTQ0t2RGQycGt4eG56Njk1VEI5NXZ0NzRKSDZ3MlFNVlRC?=
 =?utf-8?B?S002b3R0ZzlVWlBiNE5nSi9uMC9sZ1FoYlpPM2IyNWoxVnJWNzZvVXF3aHFQ?=
 =?utf-8?B?akJTUU03RDd5aW54OS9TWjEvVWhZTlU0bW5ObTFnOUt6blZUbE5yOHhIZTRF?=
 =?utf-8?B?SER1ZDUrUng0bGNnRCtBR2gxbkNYNzVYZVJIT1JyVUdCNFJ0SGRaTnFlYlgx?=
 =?utf-8?B?MThTaDRUQ3h0alpRKzdQZ1Q1QW9NUHVNUTZIYjNtNG9HUUVMWHFzMEREOWw3?=
 =?utf-8?B?Ui9ETkpnZlB1cUQzc1d6QlpjazMvcEhhVG1sd2ptR1VOUmFLV1BVWEhKcE05?=
 =?utf-8?B?MVhtYkZIK1lxcUhtSVhNWnY2YUJmU1pWUXZXS2ZUU3BNQmg0SGkrc05yOW5C?=
 =?utf-8?B?MkxUZWhlNUVrM29NbnZtdE9weVNNWjF3aDRqYUoyVm0xMlU3R0FsazZEMlVK?=
 =?utf-8?B?S2tyK3NOQWhXcUQ1azFYc01SSWtNUjJ4M3d3ZlkyN3JSMklkSUpXbGdyd2oz?=
 =?utf-8?B?U29IaGZMZ0R4Z3JkU2duUEpIbmlLZ3VPTkpRaTFCV1BkTy8vT2lCLzdLc2ZN?=
 =?utf-8?B?cGZ6Uk9vOGhEeEF2NjlxNkpXWmpiZlB6ZWpiWmFzKzg1MEdZbG4raGp1Ykxl?=
 =?utf-8?B?RC9CWGdwRDRmOXpwaGxvYmJkUytpczFobWE3NUJEc3RSanoxL3V2djltVisz?=
 =?utf-8?B?V0J6VE5ibzRlanhHWnF5L3g5amlFOHhpQmRGWkxyRUsvRy9TWnk1R0t6ZmJY?=
 =?utf-8?B?T0tmZ3RxKytDakZUdmxCdTNNMmxQQjNLV1VXRGZHblJ3N2t0b04xSEltZmpa?=
 =?utf-8?B?V0FGaEIyVjJvTUtiL05vd0tkZk12NWRqenlqM0k0a1p6WVJNWlo5R2JQL21G?=
 =?utf-8?B?aGNscHdWbEZpVng3UEVIell1K05MancwODNlcXY2M1pnMEN6dWZLNWFUUmMz?=
 =?utf-8?B?a252aDFVRktsYnpZbFBIVmNwa2F2cWpFb2FRdmU1RUpJd2Q3bSt4blJ3Ny91?=
 =?utf-8?B?K21YSmVtdWhSZm05anp6YWxhOFJxVUVBUytseCszODlaVEsydDh5d3IxN3ZE?=
 =?utf-8?B?WitwVW83elNCOTNXV05OSkZlM3k5bmh1cXVVK2ZUNXFlZVRBYXhVTFZXdGhR?=
 =?utf-8?B?QTBnNXV3aEMvSEFYUURlbFQxaVgzaXNNSkZueXV3bkxZVzJIblBtRGhVbisx?=
 =?utf-8?B?RWZHSnA3YmFua0J6VllQUGxtS2ZKSExzd2grdGNDQ2QyQno4L0xuVGNqbGdO?=
 =?utf-8?B?Nm5qeDZRYTE0ZWZvNk9HM2dpYkp1dUQ5L09PaXhKVmJ2QVpDVXZjYnY3WkdN?=
 =?utf-8?B?YUVJOWl0VEZyTlJveHE4SVVnWnU0bVk0SXhvRDVLL0ZZbVRKZEpQYUU5bndk?=
 =?utf-8?B?VFdnVjBSdXBtdGpnRzZzbUROczd3bVJiV2R6QjZoWm9uaFFmTjlnRGJCbEdO?=
 =?utf-8?B?OG56SHlrV2JCalVHQ0lqWGxyM0dhd1B6S21oQWNzN1dvbFYrRlI2VEFKWHc1?=
 =?utf-8?B?L3B4M0pya3cwemlCWWV6Yko1VmtoeHFreUwrdytlNWUwWm5KZFhjU0x5VjVR?=
 =?utf-8?B?ek5LL09HeHlja0ZQcWI5SFZhZnBERkpBd0hmYnJZN3VDNkJVWmdkdGpsTU9Z?=
 =?utf-8?B?b09HdXZKdmJkUEZoTVpZdldJRUtlOVhMNEJldXF3d2lxeWJDS25nTXkzRkps?=
 =?utf-8?B?bVYvdzdPK2tvYVBkN2RnL0pyYm9VY2lIdzNjcGJDc3g4SXBqVExDenpib2t5?=
 =?utf-8?B?b1VvVk5HZmN5ZjNIMXpzekpwWVh2eEw2b09jSk5tc1VaSTM2ZDVzT2VOZ20w?=
 =?utf-8?B?Q0VONnpJRFVTRmVxWUVyREdBUGFqeUY4UzhPckowN0U1Q0dTdnNrQW91SDk0?=
 =?utf-8?B?NjBMVENJRHhyWTZPZG95dE16N0FwU2JjSXp0aHhtanp6NGRLZUJRRnZoOVFH?=
 =?utf-8?B?RlBtT0RjMnp1SmZRZ3NtOFlpN2JhQS9kWUx1OHRNSWdrcEtEMEozMEhqemV2?=
 =?utf-8?B?VlhYdWZZS3BwR2l0My9DVDFyYURnZGZuTVBiMEk5TXhJWUdkWFJrbnRLUVQw?=
 =?utf-8?B?Wjg5SElBbTJ4clJkcUtnQVc0UStqMi9jaytaRURVZVN1Ri9vaW4vb0pSaUpp?=
 =?utf-8?B?UXJuZUkxR1dmSE1YNWdic3FralBVcU1mYmw1MVNzOG9ZRXhZSUkxenoyQmFG?=
 =?utf-8?B?MlJ4WmVvTVBTVkIxeDhVMVY1Qm1JRDNmdlhsM2xNbU84d05YQmxidzIwNXlP?=
 =?utf-8?Q?zHRA/j+0mny5KGTFjfM7XcBzyxF+xqcbn7RrVpRnqk5bu?=
X-MS-Exchange-AntiSpam-MessageData-1: ueu/U/eRix2EBA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dab8209-324d-44fd-0960-08df3634ea7e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 03:21:41.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmDfVHSUCq7HcW7OQ/RC9+qAXEFSYwpnv3rmh3D8XB+8hRPgb4v0Y1+EYqSvkmKwO9VAJ4OlXYvmy6QTCWz7vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642

If a message is not immediately available on the queue, `wait_for_msg`
sleeps for 1 millisecond before checking again. This is 3 orders of
magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
(which does not sleep at all and busy-polls) and is way too much, as GSP
commands are expected to be processed much faster than that.

Set the sleep time to `Delta::ZERO` to mirror OpenRM's behavior. This
makes the CPU busy-loop with a call to `cpu_relax` at each iteration,
keeping latency to a minimum.

Slightly higher values like 2us were also considered, but with such low
values `fsleep` also busy-waits, and would thus only add latency for no
benefit.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e6d9a97130ea..d8c00df012bf 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -590,9 +590,8 @@ fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result {
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = if timeout == Delta::ZERO {
-            // If `timeout == Delta::ZERO`, check the message queue once as `read_poll_timeout` can
-            // potentially sleep if the clock hasn't moved forward while the condition was being
-            // checked.
+            // If `timeout == Delta::ZERO`, check the message queue exactly once instead of calling
+            // `read_poll_timeout`, which would keep polling until the clock moves forward.
             let slices = self.gsp_mem.driver_read_area();
             if !slices.0.is_empty() {
                 Ok(slices)
@@ -603,7 +602,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             read_poll_timeout(
                 || Ok(self.gsp_mem.driver_read_area()),
                 |driver_area| !driver_area.0.is_empty(),
-                Delta::from_millis(1),
+                Delta::ZERO,
                 timeout,
             )
         }

---
base-commit: 9b840ed71d34ff545e3ada8be2ad5daaae542b50
change-id: 20261030-cmdq_wait_msg_timeout-26df11234d10

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

