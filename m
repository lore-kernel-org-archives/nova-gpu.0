Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385181;
	b=Aouz5YRGTrctoufKTQtPpchLIcMB5Nr+xYhWSnmFI1rmrX9tkUPDpCuOu518whxe+BCd
	 v8CdtneuHcbEtOmJHF5I+nFQCZ+PHJjg8CMsHKmi2+EyyqYwQFwsM9d5cUBxaGQhYrkG+
	 N/nmUpY+LxfN0uLWHlAT4Xkbd6bzORVh3JqlcNoBwiwT7eXi8I/oqkXzHu0QlwHEKmq/z
	 2QkZj0XZ4CHoyToTEe9lf1/2dQAiA/mmavpxZ7t0usrkeszMLXaRboJFoo84aY1K1mXce
	 o7yL+FTrCjKlxa/P46H0F8/iMwMI+AI9ECLEB+NHq86tF5Oup3JOcWazGw2rDBe2xpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385181;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GMqqwvtse6xWMOh6S1JwmmiPWU61bqTUoo4i9UheRG8=;
	b=0Jjg02K8hif4ZZRfYbj5TqPceXsMBmztoSzm/3tpOivupzDzNZhIPTGkkAYyQIEAiz1Y
	 gEMTBRHK7qrirxq0HlfbsQz/mA6CTbf19OWqTy4+3JDnchAgN5onejm2MQLU6Iegu8dZq
	 l3cdTiq664cgf+/TtBCGwaf7fLgFmqM2kZr+FmkeRVPGPtMU6XiCo7V6Z6uESN0A9Na+u
	 KGE7oFCHIkDatwlhwpEEp5kgrLk8PdFS68WMZgDf7NgKPlvWs59mhvHU0qi9WIYgdMrF+
	 Iej9Jsa3b2/pU57pqLubPD1JMdNW13ZbRk3HKuL20j+oWwuyBEEfSBIoTDPhZEJgqAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JPL3EGMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E80606A31E
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 18:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JPL3EGMh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbUVOoVGj9EXHc91Sa94vsd3Tf3qkJNncX6PstLXSzwnJXZPZD5GezJQ4/7w7JD4tGngoflGoWuNNbm6NkioxWTl+YwQhAzDMr0SIt/LzWJ4+DLbRYbdTazXIlfxA2p6Nv/ODXQwg/iWdgr0hxenynzFEinULbuVqfnz/xkQry3yodhfCegoFp9pGQPHgYN7Hjfdiq9iw37tX/pONupAk/v1Y3ysR8/xtwwhbTx6Z6Uvlvq1gvgbEMOIWvMKY1xF4ygVi/2KeHfAmZi7Xh6sZSK2ySnHgrPBTtZunGjqssB3NMqe7o3fGPEhndxVv1BaHxCbUp3NtbAdzRkB36WYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMqqwvtse6xWMOh6S1JwmmiPWU61bqTUoo4i9UheRG8=;
 b=IptwW16uhdu/3eKhcxhqFolUGqLJAdkOakk+PsR4QEbGe41nqvJVpl7NXERFAvzJ97Ls3JgAotXmFBLoF1Lx2D5RQbNWNTq5ZLqs7urDT+VlH29Moe0GeMx1vZiwNxA1D5eCwnMLL7/y8qC5uzx4BaoXQV7f9O09yEAgSDmJrb/wpg+YwtpZpHJmwmYLTlBlRLWJLZ9j5go4KRPBBOBy4YXu4PJrRDDt76MQcPV5nVbLULz/q5BOtJpZRiRdPPpHIUXmUTzE9lPXrZqF1Lh9+sdm9oZTY09DbigXSlwVt63xpbR9E/D1kjJUl5ldwQk+wlugwR/JkQfp4c+9XNn55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMqqwvtse6xWMOh6S1JwmmiPWU61bqTUoo4i9UheRG8=;
 b=JPL3EGMhogFdxhksGQjMT16SJ2jNXc142PO8osX97FisQSaStdO0t8gdZtH4OkVvMSBlD+dXfW/ECJ1JBxJM8rI9KgOYuDdtZOS2NxnhIqddnqDAM93dLMen/8sZPYQOqZNf3mAsIiJn04yiTNvOdqZDs/8Z/BgJAij3J3mNUF5ufJSt6BC6m1tAHAu2uWPWV9VEkFQYILdGJJTl3f2aJ0HceKrxzGPsYl6RxE81kD9X7KO8C8Rzb4YcivkNLQs608xWqDHlQ0cGBGFjlTpSLyqutp203nxPVoEs03q+Xqi7fXd5qkXS9DHJZRPDOIfmmQpMHMSRa8mEg3NjKu5hzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 18:32:54 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 18:32:54 +0000
Message-ID: <a3bc3e20-4a95-43e1-bda5-cea92d6e6fdc@nvidia.com>
Date: Fri, 30 Oct 2026 11:32:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: gsp: cmdq: do not sleep in wait_for_msg
To: Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com>
 <DMHW4DNFAF18.1N88RMWYD4TRY@nvidia.com>
 <DMHX5VRNFYLQ.11FZIS5422ZS6@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DMHX5VRNFYLQ.11FZIS5422ZS6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da0446f-aad0-449f-7a42-08df36b43675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|261028144727099003|261021123027099003|261026140227099003|10067099003|261021135927099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	FZS48QmzhOq2ONE9NfR0Y+Dr9dBNva0cdRTf7oJOCd1f7SkWLhNbYPEF9z5TM1d1OWYVsV8sX2oEGpxzziyTSQEWL5YPvqn9Ui09y2CcMfhPkAF+KktuEmKvtmp3B4ZigMvfznTRVtqm4DHe2x0m7N6gPUtC5A/wP4A/EH+3R1dWDON8tqnmzdgfRaJuZdqwahla3A53dn2zEyJs+4qhh+SgDuUY7V7uLbUHfsV8cC4IwOt6nE1lBhTVmSXQcVNXYke5FQKjMWq3IUhtJpbZSayzAMknbNogFYdi8XKHIIRS59PDu++CpgZVPq909Y8JikBHULok+bnfpIK+Ip6LAZGhhnJyFVu6H5P4h5W0V9/eVTXqr6Xy5ZVzAu6gxM/uQhCVZFPNse9GxeOUKx93IyP6OHt9HGG+6wa+OuAJOGHXKAPNkAyCm2gdN/z9HEwJFSBS3Crz2u+POm5XqKyEjbXxopG5QRalmKFcmwhHRDBc/a1sS1fncuSHIg9gt/Z8KR+JJ9MzYIAy1vvU1styMz5tQG6IXMDyWZLQYcBQTlXr2TD7WOD1x9hsDFpSNoxmu5NOfcq7HXC/UOILpyMGA7mBz4qZGYZJM8NqJDRugISuBFaQHlSWFsSXRF39eEEoZV9iFKvbjRU4RtPOT3KVZXPw8zVIXueiLnORDdJpPc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021123027099003)(261026140227099003)(10067099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzUvWTNLMHpvZkx0SnBOUzMxNlRmVVZkS2VPWWJRV0RzVlViQ1RMYm5QUUh3?=
 =?utf-8?B?bklBajVPVkx4ZmZEVDlZeDJ6aDNZckszbEpxWUdNVUN0eDlqbnRvTDU3VnNY?=
 =?utf-8?B?dEV0bHptd0k0SGFtWEZUazR2TmhvM2JTZ1pkdnZxWWtrbFVJV1VQdndoZXFQ?=
 =?utf-8?B?amdIVmZQMk5ob3lvME9reCt6WmMwbUJtMUVGcEpEYVBFdlpZWUswMWNjQ25T?=
 =?utf-8?B?VWZ4UHh5dXowanNyRm8wdC9BdWZLbUFrRkI0NVkxY3JRZU55L3k2YnJFbUJn?=
 =?utf-8?B?ZDZYd1N2ejcwZVJHMTk4a2w3U1VUZXRLb1hCaXdjaURFUTBLUVZucEhxdHhp?=
 =?utf-8?B?bDVNM3l0aGpObFJ4MURGZDA5TkhtMGJBMkJZSGQxdFRIOUQ3RkRJcHRTcUZU?=
 =?utf-8?B?ZmJ6NWE2UDd3T2VYeVp3YmtmZ2hIYUQybXVaYUFiOVNSZDhCL2pGZ1F4OFVo?=
 =?utf-8?B?akROMHRJRzdxbW05dHVrRXNHMGpTVyt0QUJvRU9yS0xtWi9DTitEM20rL09M?=
 =?utf-8?B?UU0vYmlIenJ5MnA2MnhIYmpYckpIOCtYT21XUFR6WDUrdzA2cGR5MmkxUFJX?=
 =?utf-8?B?bzBzRllQdlBINDBmMEJEQ3JuTCs1YmFaUHg2cWNVRHM1dWRjay9NUGU2VzE4?=
 =?utf-8?B?bzlrOWRUM01rYUlvY2hnYVQyR2MyZERrQkpFK1hCc2NwNVJaU1hNTEJTUjlB?=
 =?utf-8?B?bXZleC9KdWxtQS94Q2hSa1lDR0c3Q1Bvd0JjMmI1NFBnOFpNTnJRZ1ZBWVRE?=
 =?utf-8?B?azhNWm9EbFBPd3lZV2ttU1ZwQzd5aDZWemVJZndyZGZjMnlZMTNwMmZpT1NU?=
 =?utf-8?B?MDNhdDBLOTRkd1MybnZzWFhxaVl4WkFnR3MyamZadU1vVnhuL3JyamRwSnkz?=
 =?utf-8?B?VEF4UWhhc0t1NGQ1VVlndmoxZ1krY2tZWDM2ZGN6cklrcEhmbTlvZURoblNv?=
 =?utf-8?B?bERmZHRoM0VXQ3d2MDJFTTJNTnRKa2p3R2htVDd2Yk5mckhKRG9UelhEWVp5?=
 =?utf-8?B?TCt5azkwWFpTRUFmQVEyQXM1RmtEcCtrdGhwaVFxYVdJV3E0Z1paaURGV0pO?=
 =?utf-8?B?Y2NINmcrMHpwK1VKNDM4K2lIaFUxU2xtdW8yTjk2NXRLNlRuZkJ2V25WaXZq?=
 =?utf-8?B?bUVOdjdYeGtwT1R1YnRZRkpINmY4a1V6OWFNRFh3Z0IzTStpMGY0ZXF5K1FZ?=
 =?utf-8?B?UzVXZkJsbHZKZUlNY3RYTU5vNit1N3g0ZnBHMnBsRTlMaTlrc24xNEQwOWhY?=
 =?utf-8?B?QnJiaEJ4RXYxaVZNMGxxYXRhcU90eFRXRFRzY1d1VHk4b2hMcmpRR0lDQVlZ?=
 =?utf-8?B?NGdNK0pOK3M3UC9PWWNyeFNVakN5N09DWEJ5bStMOXl1Q0cybmI2MjJ0MjB2?=
 =?utf-8?B?Rm4yK3JHajc2TkoxSm9BR2NiZVFTR3RnV0ZxcTZnYmx1Qmk3MEduczJURGJp?=
 =?utf-8?B?aG54U010VVhRRm81T01EdmhjTktTejZYeG43WTFOSDQ2RFptUTFEZGJOMU5Y?=
 =?utf-8?B?cUdiMGFSeFk0SGNVbzZZcTlUMU43UlNhY3QvaXlQVDZTb2k5WUQzT3ZHQjlJ?=
 =?utf-8?B?dXdPdW1PbU9yN3Y1RGNDQ0VlUVNGYVdRQU9VOGJteFFZOWdTejVhcFJ2akRj?=
 =?utf-8?B?enFBbW1wU2ZDdVdCUnVPa1IzVUMvOFBzWGJUT1Y0MXMzWVN0WVRHYkRyVHlO?=
 =?utf-8?B?V2lNaGtpeDFBaXMyT2tuUkJwRWo1RndpdytMemFEZVFnT2MzRUhyL1BmRUFo?=
 =?utf-8?B?N09GeFFvUXVLN1lLN0JGb09UOCt2QTc4N2FpYWQrZEVLcWdwWUljbVlXRmpE?=
 =?utf-8?B?MmlkY093TUpRUTY2dE1hSEszdUhTVE5nSnZJWm13d0RnS1NyOVJ3bStFa2s2?=
 =?utf-8?B?NGl2amdOUnZJcW1Ma1d3QWRoMnFhR0o4ZVRiU1BrZ09qeWQwNUVIVjd0UmRu?=
 =?utf-8?B?cG5MdXpKbEdqWGxKVDkwaTZHMUI0S0lLcG5MbktwaDhXa0M2ZWl0UHNVZS9o?=
 =?utf-8?B?bTNYbEFOVVYwQnlmdys3SElVbWhqRkIwbXNmTGdBd1JaOEVja3JjeUFvQ2tK?=
 =?utf-8?B?aUg0clUzSHVuUjhsZGtxTFlMbDBic0xBMHlSb0JncHdtbE5sNnVRT1ppMUNr?=
 =?utf-8?B?S2taOFBFSFJTbElSRVJEdjQ3UUdEV1RaR2JNeTN0dVJMeVlaMkNMTTNjNGxI?=
 =?utf-8?B?ZUFSVmMwaTdndU9CaHpNalJrMkhJaWR6cDJTczNUamVjMkJ2ZkY0bjhSbFY1?=
 =?utf-8?B?VDdENFNMVEFLbjc3Y21STWcvQnVDUDVqM3dobHh0SXpkZmsvdkZzSUExeC9K?=
 =?utf-8?B?a3JYbVJFZlpyTFVmTDlLZlVZZVVGdXhyRFFyaGRIcnBQdjFYaFM5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da0446f-aad0-449f-7a42-08df36b43675
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 18:32:54.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUQJPPQT0iej/J/Uk8dSakbuq/xJwChxQirBnNxW9WJtittc3DHglau3QDSNwNpjwzolFbBIPYYqhuuj7S5P5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973

On 10/29/26 10:21 PM, Alexandre Courbot wrote:
> On Fri Oct 30, 2026 at 1:32 PM JST, Eliot Courtney wrote:
>> On Fri Oct 30, 2026 at 12:21 PM JST, Alexandre Courbot wrote:
...
>> Previously we had a discussion about Delta::ZERO waits [1] and Danilo
>> had some concerns about creating unnecessary contention by reading
>> coherent memory extremely often. Also, AFAICT `fsleep`'s busy wait is a
>> bit nicer than just spinning. WDYT? I think switching this to

Yes.

>> Delta::from_micros(1) is probably better.
> 
> Anything works for me as long as we reduce the spinning-induced latency
> to something reasonable. I'll resping with `from_micros(1)`.

That's good.

thanks,
-- 
John Hubbard

