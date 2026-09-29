Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A8347FC0
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714628; cv=fail; b=JeMjYTTMYGnb6xqOyiSt+Ov6KbRF2P6OvqwtdBKCqttpidkUrV6FqE4ba9cJTfbWqP6P1ht4aQWN1bLliLVS57WEK2iUjuyWZkO6XsBphMlYCO+bBc1c3OJy+2NVWq23Rq8VvfEUxHpo0+/bLjJlcEk7WxdMk0icYZ11bkVRy5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714628; c=relaxed/simple;
	bh=9l8a4WatOcSD5iKGtqPYuliTeUQlzhuOHWLrNdCbT9U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lU+siabJIdZa3EhqOeqyDGSbPzbV9M2Y5YZe0cv7WYaC3anwiv5FHoHG8/6GAo0oZgWnwDd8dB/ZihMU2iHb9ZdkhwZ+yBQZGeNuF8xF27Q+POu83L3nyTvyLWaH1Lyezfcz+xv3v8b6D+NizXSkP4EDfH2xto1gm3oEa5Z5pIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F+fN8I/+; arc=fail smtp.client-ip=40.107.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F+fN8I/+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKd6cCYq37v6oTcGoCnwEGLLf74LJYgXIPY1XARU8jFtB/NQvkwXuLfBEu5KACKGMFSchWQ8FMNPZOOgAGWFeSf+SY0l2zQTzSgm/pDVzDAExAwEOQtoEwmlboQQ8cA4k3D+0gxWvuOydQzHJqTFwZ6OxMN/5w3v0tzt67qicBTZRgrHDAbMYx+0srDpO40MqyjYQGcLEaqny2L2esj8wiZNMRBBo/oh484viqkgagekOUHMDVUxnkp+8cOUnCJya2F/sasVZNfIj+e1tVkHm/cGud0yzTMgyi2HYHKyynOC8ltn0Gx9ofLEJsbUEziNVHPknM3yTfsV41NF1PqJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ23FtSwA+3psq6O1JXHPjX69u7XUls5ilCEm8gAkng=;
 b=ANEvyJrf4cjx3A19AhA8tW8FgGs11dtq5njYZH1LL4GAIu6x6AavL1EEPPLL7z+tt5FutPriGXKJ31MT+ggDO0OZ//crHWaKv+TB72kDLXLAJdB0Pwh/eZPW3Z/qbkvXnSIGo8gUnk4e9f2nUg1wHjAgx8kXrP3/I9FCgrlHgltHm3msUb0xJ94qmrcbXiWicRItRvQQy3Pw27g+L7jZ3esbcZH/oSJu9Mg1wHA1mxdVJZHwcvtULkMY9DTaHueqSJeslBoXSBYgvWAhszAWev7Y0K0nl+l9A0QJXbUUnUpgxfms68gc+bpB0bo1MEPAKNRuVjYF+rU8dCGhP3QY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ23FtSwA+3psq6O1JXHPjX69u7XUls5ilCEm8gAkng=;
 b=F+fN8I/+2gX39VQgnHOx+VFGpJ3UrGcU/IkjEDKWE74Spna9Sc4j+DXNze1oxB28W2p9KwEPfRkSwswfno+uy/QKYoM1omyj0addcJUWYsQQiqkP8W/3RfmXT1U5RZZ/i4Mizal7liUGtdjMtYKhVHgK5mXiY3pi3fUEw7mZkcXdjI296g9DqlG+29IH7ezwvjkuMBaYQEjVeNSmU+SOvAWKkDh7+ToLX0kl954ICEtLPfsi1s9WgU59reL7xGHYUoUTyvf8TbXEMJ0p1MzQ7aGmR24RPpqVng6XWTqD65CMBp3rJ3YAszS3UoseZLUl43ynSmgsMpYsBtZpHI3e4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 20:43:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 20:43:36 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH] gpu: nova-core: restore the "Probe Nova Core GPU driver" debug print
Date: Tue, 29 Sep 2026 13:43:34 -0700
Message-ID: <20260929204334.368569-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f49eaf4-07ca-4ad0-60f2-08df1e6a55d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xRegxPaMbtmp0rH0pKeQsNFYNRZUKpQh5qnuGoKXS75XK0dNDoFU/CWpEoU3HE9u0hVFVa5IHNhBZBHNn+Ws+MLVxH5k4SfQaBBqZFvxFEMNNvyAmFIvsTYgxaqlAajhTX6suXCLg2Ql9lK9kpOhpSocBpBPjSMZmbZgqKx/K2HI+POKIgzLWmg+SUnYbLJLIr1ce8BAK0dbX8VVKYP69aaO70EPpiNyiCQeYzuSlKlTTnmMcSy0BAUKTnixoyzgYGbiESSOzHqX8PyV/SEHJ+/6iV+RKdc7gAY3heaagv/g12iRwFTz68KjzgUSYOWKb3nJCdvXBcM47cDHqU6jJhrrbVCf8IBAhT3udw/1de2NGApGRKYm5qiL18Lr5BlqgVsKZRBfZXgcVkq/3CLsVOCtqgDthv3IMrf5w8DsBvsr9UKLwAOCRpTORWLP8thq63yQUvJZI9QrargjNIphM7hR5kLyuUOYMqKTisO+yIhkJ7UZe3XSFm03CoQu6bTUaFRf0XtwrSRy9OEbUHudcwt05k446ptecnTbmD5oGpYgZRiAO2u0zhpWJOQi4th1PAbljuDJcmTafQSCGr2G5vfpPFiVlKLWB/JLGOisBPSqUey2SlLL9OjoD/tnFUO2UmgDAaMczR/RA279ca3qig3xOSyr/G4fD4yMQ0PRYgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4IuQNjtZl44PfL2uzqb9vXq/2KbPd+XxtDHLE6VWhJhzLNkBYvGVYzHudVtL?=
 =?us-ascii?Q?h338uVh0ZR87k/fn4dJH2PT+GHTqGj2L1TyqUkQ+c04OxON2NBGHjwy3972H?=
 =?us-ascii?Q?A8HhSYOIiT95FqRBPDNlcC+cf+DrJ+YaeIVpCHKd7L0O4wvfHfO1ZpMYNDOp?=
 =?us-ascii?Q?sEHvAU6lCuaUncaeeQX+y2uecEAaFZNllGhHwF7xvYrt9PRSANZtZMif1WqI?=
 =?us-ascii?Q?94N6zHgtP87iLEfnwGKHYeL3viGikSw6dDxer6I0j28b1mtsphzyFIO2/K58?=
 =?us-ascii?Q?1rNXWAOXMN/exReXnMR8dM+e090Zy0mG/yz3a1xGergeKIN89ZBEChV29yeV?=
 =?us-ascii?Q?pIWuDsdQ2YXFk1+nYXIANBhjv1s9f0SXGPo50O3jOtWqOyWBzlsrHb7LNfcK?=
 =?us-ascii?Q?rHiEog7id4ylPXFoRBZIoPniNnxxnE2z4Di5oCy3vC0rVCLkkWu3ReWUeqJ0?=
 =?us-ascii?Q?K9ZTD2fE8gNWVYL/JabkMuwyf0qo6gzmB4XVuN6oUOoHbnXIryjvWt2pIWuJ?=
 =?us-ascii?Q?mG6/chZvd6qfggla/+hpijXvm6kAtbCaNEzK65d5T5NOMkxVIhwJfnYl/6Ep?=
 =?us-ascii?Q?bz+CrvLOJpRiOP+Wm3F6tAyXe8m6PXOKE1nWqh57GJZNL7EJv2IwfPGNFPIV?=
 =?us-ascii?Q?dSMFrRtENEIuqCG2OyqbC80uE72FtYuf3tJmEM74TsbZ782xZsW5NZzKvGqy?=
 =?us-ascii?Q?H0iKiPToAJSQe9xKbGlb0YvulmK5ulWClJCsZMkKgvq+KZkMvbN3mQDQ6uAQ?=
 =?us-ascii?Q?R8TABzaDN6W8HRvgKB92FBG0Tpy1EGpsXquYqPhdsuYj1zC3X1B6HQuc1yMu?=
 =?us-ascii?Q?4MFuDo4F9iUA1o4iL5gGtDcLKgQz20Qu5oji5Qwv3sIlQ5jlQSFvLgkIqyyU?=
 =?us-ascii?Q?j7diKSBjwixDys4JSQI11tiB3n48nZ4KeFSznWbheI4nPHag49Rgm5mJmWhr?=
 =?us-ascii?Q?XdB7CpIobwhyKq6A3Tr5zY5JVAsasteOrFHmyOhFfCXD8fR++WEmjkHbCAtG?=
 =?us-ascii?Q?wSI0VmE2al7jfpV8aK7jaCPD9SGqeIHa/D4ODL1DNrWrHW5PjlXC9h+aXhXx?=
 =?us-ascii?Q?XiL0LBTGBC7RnUktVhc7wde1Foqn2U64hZZonF7U/F6JDU5Dd5EeGdnO2JCP?=
 =?us-ascii?Q?H/O3ix0bXb0wNQ8RX8Ued3L4KN+NQGDK+WbJ7UtSP57Xbz8y+3mKd1e8vHUR?=
 =?us-ascii?Q?zogI0tMwCVe1OvwS309xMZivQCYtuWQd9ix9tgmg5jFsBHJ0gYpKtc0sw/zl?=
 =?us-ascii?Q?HsulitSUzF3KaqdlNzUqm+qBAb5ig8wVGIUB0n2FRXRl/IR3OT8W47RJifJw?=
 =?us-ascii?Q?OIwOeAwtdAP0z+p3ARDwEUchF8SglPxB5MB5QIoKI6r2uIrJU7Go1ArU8O7C?=
 =?us-ascii?Q?j0e8ppndl5rnq2Fu5CXvyyGQ3NSNcDvwRw0plVxDvQn9JDH8J7+5xq+YGlXV?=
 =?us-ascii?Q?0zeeZLCQPmNzZGfsLBXeBKCAbV1aDHlSDiRmnkvx7cTBzIuA5j0p2nqLRE+q?=
 =?us-ascii?Q?Udq9Kh6o5RpzJtNjNvVpvZPSqxWXJaW8BIuP0Bz3xH6HXK9e+jj3+35r331B?=
 =?us-ascii?Q?3G8hsZcwcdr9cvphq/nUNh8vDGhIuE8J3mikPoRXYWxNK0zrgYqRVDd64sBv?=
 =?us-ascii?Q?tY1YnSbeELTC8RoSxK+HEO97KxT7pCZ8puCMFwICjfeSuuOzWjQSYlcBcaqY?=
 =?us-ascii?Q?rYqUZo86Tcsb/l2jQD8F9IZn+MQevCiwjSnc6vRvBKcQMy9a4vtOdpaOU/Pa?=
 =?us-ascii?Q?ZaLNjxOFnA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f49eaf4-07ca-4ad0-60f2-08df1e6a55d4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:43:36.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jjk21oMP+JTZPhzLD8xhMC585o/uFB3tC0LC+zUjUdwX44QyzsT/yxbICNL1BFLCFT0sN8yYSTSkDx6NXIZmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013

This is a high value thing to print, because it acts as kind of a
bookend, showing the beginning of trying to boot up.

Cc: Danilo Krummrich <dakr@kernel.org>
Fixes: 658c5f0042e6 ("gpu: nova-core: use a single try_pin_init!() block in probe()")"
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 291a047e4d86..96f2638d6400 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -102,6 +102,8 @@ fn probe<'bound>(
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         try_pin_init!(NovaCore {
             _: {
+                dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
+
                 pdev.enable_device_mem()?;
                 pdev.set_master();
             },

base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d
-- 
2.55.0

