Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32D3C1D54
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111555; cv=fail; b=F3zLI+f+2bVyA1qlYwWsNOxwT+xZc++R+XPsGXJYpAZtbTFCYSOg6+w2N6Qi1UhUiWlVKeFMLclTE+DgVGuOZAcRjv8I4KNsOCiCrR/VLkMFqK7fRWbdj+mwkjaTUex7cgnfT8tbefogrVT+6ygOcR8MracTlVBfaQz+35B7HPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111555; c=relaxed/simple;
	bh=u0eV53xqM+txfyKGFvEoc79OUE98cjVlUG0Q81H/C3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l6OlfXRickO3grTGzE0zADTJTfNmW1vhqIViDxcgU3yq8J0/Ewd3JSvk7xWkmzWc4N+/ow217jyhjg3iEC+p5zysRSmbhWBCuedsG6JPpFMDLvvZAbWCLBvak+c2KDOjeqJG24dWoLSrHISn6jsHXQltTBm50iY9JOGvNPhgMqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ijA1bfz+; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ijA1bfz+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmSyndeyOwbDHWYAjzx8GGasCGuY/vSw+cF5d9BzpdzC1fAOTpsC3RpeBQF3zq6SFqNTyAi5CJQvZybURev2mRAu2kInwj5k+YPTChOqhFn/5E3TzfyCMMD+MJWyBmaK5/ghZwb59f3JKZ7QzIc4sNc2iveVDpJpWn1iB5NZAAqA//hq1VzQ/6ZDBHMsiUr56VrskmbW7SzPStvwDuHcmrShcmSQAcploHfGFInN7Vz6IXYwVGgOQziBI5q3HDXWZJobguTQfWLfiX+inR7mhsjudzjAzbv9x+n+KefuXib1tw7nM3bAjutFO5zUSYwSOOZLw9zUb+3lewIS3I2WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/rZJ1pL+BCILP+KdTzorjyPCJeenjuhAgTJY2VpAzk=;
 b=nYiicy2KsehqYEWDs3wLTywIFA8m47qneNZgT8dH5q3QDRl+U5EfG7irjKXS+F7KYNYIHtI0gcv7tALAafSWC+dLDJvyj8WeqsLOwIdsNkCVJhrUUwU5Jcgioq34kB+Vy7MTIg/lONxxMAiH4p6x3qedU/YJ4OO3GBD6GHRF+Dx892EXiKVy/+jXmS4WZn750BeYwzq+Qw8GN7PJtOdu3RiMQvu3aQtt6biNJkdwG2sY3SD7vWZxlemU60OHHKlqO9nelxlCWJW8cZclZ0Nz5Scfgqfb/bXIs/sRgEf9TQU4tWBF+EXR6NFxluLIa95tB++OFCaPyVCVb0mgViayww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/rZJ1pL+BCILP+KdTzorjyPCJeenjuhAgTJY2VpAzk=;
 b=ijA1bfz+rC5soK/rRiBC6gsDvI+zu7fpfTB5JJtAP831/Ss7bEa7h4YMTPIM701YTd2BRxfRTb1QSYB+cw1zrCuBY1Aqh7+LQ7/4+Y2i2U5sa6tEV/WlfXPQzZ1r51kgvfUU6xYywsg/WBA+riusPonD00nB0UEFfODN/WgRCFfZIMLWhgG3+0hotpPhL4ipIr2C81Sb3MH5YtfRXWCrw6GealRdubiZK606hXIsK7wsxJLq1dA1+dObMZfXPAAphhP62W3XETUQW1vLSSX8DmraD4SfIxR39ujejprPw6sxB3iky2imNzNa3BMvbwhvsNmVmpunFe2XenzniSgHgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:26 +0000
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
Subject: [PATCH 03/27] gpu: nova-core: set MCTP transport header version to 1
Date: Tue, 18 Aug 2026 20:51:56 -0700
Message-ID: <20260819035221.336390-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 882c6899-75b2-4788-9711-08defda548c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CODVW1LPIphWcDIn/VygOyGXR0eSOkJpwU2FMy8YFNsBumsLtr42TVesa51M39kYS9ZjxN4/zOgt261mSX4ppSZIFl6MTbq33be3hWRSzesfoVpl1I+tXrI+OpMXDrKgsRnB8GrlA56e/B3H8jy0/j9SzaRfx2Z0rJYX7pPla74XFe7f02Bl1SpYd80pqxiNgBwnBuLyzbgtWZ1C94e5Fy0icKmWSnFeFSNpXKcKuLhoa2+AzSvosp5/wEtMQR34ygm1J5CpeJqXsermGTwkfHjpZ5ESEtOUZlDhzvtWmuxpdbWC1pFrotYyn3ZY4x4mz58bqwMchQKFyoi8d/TOdZKzYPfwdpIVhaM/9DnmVcQOQgvSTsyUP3iF3u9Sv9SJwI/jKu8jBYC08zDYaS93TVkW9fJGedwC8u+RwtpAbNQB0y0c4BFjHcHuqMR6qZDhyDHRigwT1bXxwod+MiRYtHB5xcgUXCfOiJvOaQwyVE8fKgxJGEH0kS61rgkQ8ZHS5QXLcDsVw204cjV5i14ZZNEjcTg8xW4ssur3gGL3Uq9famJf/HpUSGE/f4lAasJyqF34GpUw5fUvzUtDMAtLlenqI9CyZYeo+CpSy4pS2V5fy2FPVIjcw1jGC0iAyAbn7oc83kzXAzsYFLwkztdHGsTyRBmgJsFsa0j+f3UHthY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nqf/15SuYlqhY53kW59Ut1zKhm2/oXr+ptfs8/R2w1ERZGth5s1FApdTNh/6?=
 =?us-ascii?Q?Uo5Z9Oanvkhc+sSYDdBmXOZQL1Crn7H7rmtMHREXE4BqrLhLUfmbzHOKtMtQ?=
 =?us-ascii?Q?QXuJwbpcsq8G9V1gna0TMw6kXDEHVVKTMmXIjhk80vwTylyQOKmggfPyW/xX?=
 =?us-ascii?Q?4ohpX24i2f22EVrkenT0TH8KV1J3t3+B+ywJko10LBX2D2jfbqRlcRyFZRLj?=
 =?us-ascii?Q?Yvp3b+5BteFYoMetrwnCfa7f12MfkS6B0q4VlCDK2QTwzQlAZZy/Lodovr43?=
 =?us-ascii?Q?k2fH4AmT7JyrYM7ZJ/sfCCBKqaa7/qIx8zodPuKHbfHAGp0jE7PWmV0SWRdS?=
 =?us-ascii?Q?VCdYAeEjGdkNgU5sCbEuUuslPd8G1MuMSmArk9XL/SueHa3V4NByse/0eP7u?=
 =?us-ascii?Q?IXp+xSn7CXpTAY8SaKmrkMLafh7k/6gGtHkicHDVksV8K85FBCk2r4fC4wAY?=
 =?us-ascii?Q?J5Fk/RVZtdkSoytST4Le4hQ1ljV8daKFWvcMAS6ZPgEwWmNA6FimMjbmW4FO?=
 =?us-ascii?Q?pbJqmb69OFTQoKXZISRaQlLW10BmUf1X1tbpR+pNxSVpFB2cPgzk1NzE58hN?=
 =?us-ascii?Q?qOsPrl/2TSz6nYnqzt9PicDxyvoyNK/y8Cy8cOrpek90SWkHVZ3YMc0/aLxF?=
 =?us-ascii?Q?WAAdE8eXfK7KlQXQMWIinfiT26BlUsF6SF9FGBg/Wi98leb7wBPxd1wBo431?=
 =?us-ascii?Q?iAo6RkvE1dYGvtFQEdwUSmszx2105RxV6ypVjO9RZkQiJOgNkcUVmYVyGIGK?=
 =?us-ascii?Q?CAzTWCfUlm5+BCu4vB75Ts6l1/q0GaHZJyBcsUBCV2TOv276ipY57snB6nEC?=
 =?us-ascii?Q?tpNDPL9jYiz5mAhZMUoMqRMkkl6ShJeAhzRRCLyyWJeCGVcSPGhsAR3rNiHW?=
 =?us-ascii?Q?RLeIN/iUHsyy/PjGciGj1CDNu9XqgFYg5yYbrDHOLpfXxgdhFMI97P8qqQU/?=
 =?us-ascii?Q?TFJca6z6TuAHKu3/mtLl+dcm4T5K2pm4Bh2qOzbiSBs2qUWynr3MCC8FLnWw?=
 =?us-ascii?Q?ofuL0u8NI3/gAg/vcDtS/SnIEsmVqZVDfrGNoE2AIp7dFwMmRUXGgsPoe7oh?=
 =?us-ascii?Q?J+r9WaoFigfzCb05wcvoEUKax49lkNTGJfxifL+tFhn3QMZLK2rB51dEKnZm?=
 =?us-ascii?Q?DqRIujdL1zByX1dM36lWGVzr3Eez4Hs5MVdpNHg3qJStDtRNWfbCD/CUa4aL?=
 =?us-ascii?Q?qK03RqMrb0Vl7oRlCdtbRmaCS6ma6CD9/aNMwxL12SyzKwDzZoAbE/InhCxR?=
 =?us-ascii?Q?HoJW2vv0Qdh9AZv7jKvYfg6xNl4e20rPGzR/CDeJMyxSSuYpHXIUQkdWAqAY?=
 =?us-ascii?Q?Ay5eI0+1TRCHJ3KE78HiKrgHVVJtsfib+AvzJPDFpuZnNiXOKQf+GaHzXiPS?=
 =?us-ascii?Q?zBRGVhgmR26B+5a5hDlIbDOZVeyxvLXmGMjumiu7/PhV3mp14xwfSRFflXZj?=
 =?us-ascii?Q?RGl1zIrZiTuQr62dZDMIIlc2A+vmg5oFWTU8BqX4Ns6ut5IzjXh3uxXnAeBT?=
 =?us-ascii?Q?+gzR0UWACRXQg79Opo42AqT7mdsCMTVHOdBQiC3czuvPogPZTnBENSAHrsOG?=
 =?us-ascii?Q?dP21p+EawPB5V6MG9+zqHvRgp2ftbKnhYX1V4fYfruwZpV/Dn6VJB0Z2IJuh?=
 =?us-ascii?Q?YiXtuTt3afbP0+6P86yLVFPYThfUBajNVDKwpDeFIVvY4j7XtjGz/ldXD4md?=
 =?us-ascii?Q?2pYkLQ89x/qFf4Vmu/Z2O3mmnumOhKQ1fi0Ex2CbIvVbYWfVPdxO3o3KkHpn?=
 =?us-ascii?Q?efJ6bNzlCw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882c6899-75b2-4788-9711-08defda548c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:26.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTqFU+GqWnv013qNAsvi+kXyDmVhlYIkb9QUZ5vnDTF05WzzjmKodkr1Rqt0SWFnEkv+vNhu+9ZnaMDY3FWLLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

FSP requires MCTP transport header version 1. Nova-core leaves version
bits 3:0 at zero, so every CoT and PRC request carries an invalid
transport header.

Define the version and destination endpoint ID fields. Set the version
to 1 for single-packet requests, and leave the unused destination
endpoint ID at zero.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 90c642c91a72..03546213da28 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -42,13 +42,23 @@ pub(crate) struct MctpHeader(u32) {
         29:28 seq;
         /// Source endpoint ID.
         23:16 seid;
+        /// Destination endpoint ID.
+        15:8 deid;
+        /// MCTP header version.
+        3:0 version;
     }
 }
 
 impl MctpHeader {
-    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    /// MCTP specification version 1.0.
+    const VERSION: u32 = 1;
+
+    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`, `VERSION=1`).
     pub(crate) fn single_packet() -> Self {
-        Self::zeroed().with_som(true).with_eom(true)
+        Self::zeroed()
+            .with_const_version::<{ Self::VERSION }>()
+            .with_som(true)
+            .with_eom(true)
     }
 
     /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
-- 
2.55.0

