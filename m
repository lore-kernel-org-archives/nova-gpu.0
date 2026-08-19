Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A83C3F7F
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111588; cv=fail; b=Q9zhGPWOS5m65fhDwBgk5pYul62IR0udxHEPBSJIyzKLoZt2XmpDh+qH4VHCzp995CrEESTzTOnLH00FySl6stkQEhWKMsSQH0CW5Ti2JVmhdcFiR8uriJrw44DSi0ZMqzWGQ1pF9yPhbL5Jy0yTuoVROPEqs77bFI0IumZUjBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111588; c=relaxed/simple;
	bh=2NGMAAm3oVwHLM+XeZH4xDCyGm+KmgU8CqRggeM3A2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hZTs1HJf/RL9HQ2Ul2ssQHPn06oJaiILnQ5WB1NE+Hlf149aheVMz8aV/eiHYTWWKOF8nwxhiCrMOzvFWBTaLNCOUW1DkA/jkieagO1xZ/tnjX9Vg0tWnTVYe7vystqwQ5R5r6eh7RdsXQxI7xWa9RUxwc20wAhxG7AAOihxE0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GgKjiqc6; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GgKjiqc6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rv5mt2y2rPUxHxN9OhWkQnnQWDuteMXK6P455fziO1wBqGJ/n0i4B1IGjM4kskh21u8ZbqCLcQwGSH6+IjjlA5l56CczrJtgmjvW6u3aZ6Ape7YvZ1HR75rixaCEQCdSy8+ybm/hSZhA+RwG9NZQ2LQdGCRIqGVJ+iqfySqQor3eAGm+gC7pXp1lc6gLUtrgs+/IdLREOnCyabOi/A8mVylMGZDJxUCLWgRkqg1jCIYIxfIkKeBIqD52eTgjm7dbhmzvkfQnh9jfdJ3mjIGgVShTbC7UVrHs+UJD7M9j8t2l3DYq1AwcQh8daOURvrhgoki0cMGtZ86Tn+y/FYNhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U62gGSM1nzq31O77d5dXuer7weF+r8FLoB4AmgXz39w=;
 b=kYY1EzfQ8ENrZ/xlyIpIMSs9WmtbU13ZJqwvftSirK0eghvnNm/O5p0YlrRoqxcdzrmxh3bfZAyxUP/qKP1WWcxF+Bp0KJoEmZLVCw5NDjiwfYfxKmUUY2rW9ZmnK9kaESf4rwzAZv06GWmLt5Ak/Att4nmdLvcdBkUsJfz9qpaepVrE6z4Jqn9IYl39NMeEe36t0G6o8RCDLwViOqAALGgpyMQT0yjMCMnZCgeQGJGtRw7Mi3oDIMsCdpO9xckGkAr/KDKI+KQuo0EdUj/0cQsQl6IAtmOyV2s6V2p2eoPn7o1oAhwzFljl9IeJSCfRfTmHZ1v6f66sy97o23BWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U62gGSM1nzq31O77d5dXuer7weF+r8FLoB4AmgXz39w=;
 b=GgKjiqc6TGqRLhff6DXCv8mjmL/dD9IQqLgNIHXMQ110aMAvhqwb4EqcuCm7J/nBrPJJPczbUPcmDIOvLSY3rWAeJbYpx0i2P+Egr82KWgxsgF7aHL79yc8p4iJ7Lm15QUowP0+t5Dn57kPz95OAwRobBndkGWkcUZ8JqcANS59Jco2HdGWD1cgXM/g1vEwwY9Gn3nTRwW20qM1a9zoGzBgGN/skm5sl1SNdb5/aHe3OXEVFM5EYOQQA/2HKeKOKWkia/LxA3hyTy7h74LHfugYxH1+Y1DJSGVHjwbY8CIvroS6rZ96sINTktW1TpyRSH8Su7slXfmi0YZqSZXnnAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:51 +0000
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
Subject: [PATCH 24/27] gpu: nova-core: gsp: pass the remaining log buffers to GSP-RM
Date: Tue, 18 Aug 2026 20:52:17 -0700
Message-ID: <20260819035221.336390-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 930f6cdf-5a2a-4e96-5a13-08defda5578b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aNo+HdXyrKgmpamE1DfoTp+Qb/V9KcU7cG9xX/lRQRIu3FsaD55DQtNyhB6H9Tytcg6JEQllSWWexlHpxE9SdH26uPoJaw9bdfpaHhyv8r1vk+5FN+k8U4Vgl9RmA5ZqAXlFbg+s6hbA7JSzzxvfIGpGXTSFFZ2c9WpnRJAhUBNDS85sEwdruVVTCK+zwf1cyA2Z0TxwOJDRzNxgiZ+9LxNwMQfMC9OeLzbYjgRwRO6Q9ojZyf1ykzy0J+CB1PSyCU0IJs2FtR9Mvvfsd8A1guesZZBt4kpMU9uMUqJYxf4pqKCt8ECCSFFPsf4p70bHInXlvKTYfPaZ6MyZTPXyWM4/GY+/7IIHNtYckqnuIyN6aHuoclc+a1eTCTKeXnkcnwmqbipUG0etMV8QFCDndh/W9hKpH6X7ipvmNq5uD8AJu9o0gCl4nmNtezu8M8T/XlKhJ2pxseCDKHToP9036CQVNbcW6fBkLWsZ6QSDv3cIj+IxxpenPWuGFNuC2+3rpM/eXGlqblesh6RsENIEPCUr7kJtl2XqFv98Ifxh0rH8DmRgnqOIYx6v3ga5O0W0BjG46p1HESOhzCGzx+AKgxmVwdbr8Xr0sRrjpD5Fzw5C1KzKcQMKhX2iMPoj2hdsAxD62fxu+em0Oj8f7+1Rm9jBdVugCqQVxtqUEnS89Sg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zxj8cDHjH11N9fk95u6nBAnNFZEeFpFaJ84NzAH3Fkw0hYXL0tNarvGMZoAE?=
 =?us-ascii?Q?+tMHYAQpfkJtelyRC0W/V0vgwOKdKmK1zaWV6LEan8zk0Eq/I5KOExz5+/N5?=
 =?us-ascii?Q?HuNjI9PT1ejVIrE4/gU47y6qPKwMLsXjLysnzSXkNDn63/AwV/a34dXG74gw?=
 =?us-ascii?Q?w+HcjoDCeKE+gaT60XLnXQqwXzEnkiBoi94tE/gV9GAI/j+QpWndJXo3JEjW?=
 =?us-ascii?Q?DgZNVMQ/RfB1ektQh0FqTQlloctyH4km2gnXuNiDCtfDIlrBZV4mwQfbK6Uy?=
 =?us-ascii?Q?5V5tyNK/iugGJ/DB3iZaDnU3RoiF/K0N0PRZpNrtlbxT+DAmWDFhK8Kf3oJT?=
 =?us-ascii?Q?d+1z9xL1jfkCfTbrNyc7PYRhjzwUjWIRWBMz6ImHHnYF8765efFvnchr+CvC?=
 =?us-ascii?Q?54hxpiDc7tEkRSTuq9l2szpoXsZHV/8SJ9BFsZVwEHOV4bbvH3ykMcLB1CmV?=
 =?us-ascii?Q?WQor+AkNstq/jjY7g5im2iIeKlUB4IJ/O3HOtRs5Iv5SkscGtZI7Nnzc4J7/?=
 =?us-ascii?Q?qoxi0o54acrnFKYoE+H9tUsZ7TMHNPS8jz13xJGVnZPFzcGkpk8BJ1KHX4R8?=
 =?us-ascii?Q?3+lrRuOR1lyHl5k4bMSLAjTbUHUKHGjGFOCWChbvKf6xn3VmARR9rJuQSBsl?=
 =?us-ascii?Q?p5iAOQlqeLqI5ilO1mXyvwDAu3Roef4CjMbuSV2ksWWol/CDt5x35YahJLV1?=
 =?us-ascii?Q?XHT8v25at8/Q77EiKtks8DHGmmSNHZkonkLCAndEScisKkCAbRJXhrLx9fom?=
 =?us-ascii?Q?oKw5PNz4WZrgFNb3T1aQlqv1vZLsB4NmM5hwnItfuSqTMDPMUo19cK9Ttqp4?=
 =?us-ascii?Q?wQyl6RV8y5LVKHAhqMLa5VeNtZWkVU7B2PAsL4dPSBYDndPEhtPYKAL/TXYw?=
 =?us-ascii?Q?v9+IYPp4+P6AmlApCd9viR/CBZVWXH6TtdQG99RqWt1fLFRCxyphI5MTgAj4?=
 =?us-ascii?Q?4zmcRu290SyhujiLG/cygMAy3fAQey99Oms7/Gfa7R8YHKce46II1i6VrWS5?=
 =?us-ascii?Q?fTyYycu250pgqXGqCrUd/LPxbYfndl33++f5dfHZl2rQNArSoJwSpqA3Yq0/?=
 =?us-ascii?Q?7XUYZQZojW9bkq0ZFJRW3cclgQoJ8ExEWfaCg+dMF0sh7JRxnsoMbMWoFicg?=
 =?us-ascii?Q?mkIprW5RvStH/g1pQZIdSZ03JrSWlUyG98fQjTlYaoCrVD/iXvyQUSw+Cw2F?=
 =?us-ascii?Q?XTj7e8zSuoQg+ZYa05RE7EROjymf+LR+idQizpsexkqYf0oHh8TF/uyL4TOP?=
 =?us-ascii?Q?E11gjIvvaCLmgWBlkPKFbKm/Cl8kI0icLgauEizC9zEFxi6nscrnfkc/MAzG?=
 =?us-ascii?Q?Lei+nQyoYkKR2AuNmZ/bNBWmXj55tPtEpziohz0OPgxb0bwEPW5F3A729Kkt?=
 =?us-ascii?Q?2KSMRih61kf7FvcRx25vbgoU/YzqfEEg+V0MLPjj9qbzPqbXuR5dqHP74XO1?=
 =?us-ascii?Q?5+U+29P+HzVxzuCUdmlY3547BTaQ9DQ7pgSkbJg9UQj1r7en+sCgZeF6ZO5Y?=
 =?us-ascii?Q?fpHQqYokVcVblqPknGXSHU9wOuezoTNNXptldOvEFYPva0qniJrd5l4FDAdF?=
 =?us-ascii?Q?WxGbnnS5ROFb6pTckcq6mU6R8gf52QVL2sJeNpkd6Bsu+udUbVPg56HQaKaw?=
 =?us-ascii?Q?Kovb2GhAFl1UKNAnjCjTTdA2tP5SqiqoIKNLSQvVAB5n7DEFb/eHoUNAhJXm?=
 =?us-ascii?Q?XFa99CzhAEGHga1/fFV6U3GxQJWbWvvpqhLp9pjIyBI7ZCjy2JtQflp/CUrC?=
 =?us-ascii?Q?ANqOa+qrDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930f6cdf-5a2a-4e96-5a13-08defda5578b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:51.4903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqBizvdPvW2I+hBf/u1x2KHmKd3iiPy64+FCSHll42tymYSqDrr0n2IZnb7Lo8aioEhoDOij4mGmbrwe5mQBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The libos loader finds each log buffer by looking up its eight-byte name
in the init argument array, so a buffer the array does not name is never
written to.

Nova-core allocates six log buffers and gives all six a debugfs file,
but names only three, so the other three can never read back anything
but zeros.

Name all six. RMARGS moves to the end of the array, which does not
matter to a loader that searches by name.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 232905638169..f1bd66024b72 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -355,7 +355,19 @@ pub(crate) fn new(
                         2,
                         LibosMemoryRegionInitArgument::new("LOGRM", &logrm.buffer),
                     )?;
-                    libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                    libos.init_at(
+                        3,
+                        LibosMemoryRegionInitArgument::new("LOGMNOC", &logmnoc.buffer),
+                    )?;
+                    libos.init_at(
+                        4,
+                        LibosMemoryRegionInitArgument::new("LOGROOT", &logroot.buffer),
+                    )?;
+                    libos.init_at(
+                        5,
+                        LibosMemoryRegionInitArgument::new("LOGRMON", &logrmon.buffer),
+                    )?;
+                    libos.init_at(6, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
                 },
-- 
2.55.0

