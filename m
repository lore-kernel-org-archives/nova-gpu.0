Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204E32FA18
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363785; cv=fail; b=jPVJtUNjQPVeHvhgIECm/yw3vWEBMgDUxuETGVtKwxMDnIs0vY/cqV21hndN4yFoVJNo2nqmH9euZJZwxLpc9BD9Qn9Er1FEBMTMudKnSTyowYWBnhHMbn4KKmF0vSY7rYpnLexexWsYb+QMUaNOZ2UTGXHFi6HgFDshcif/smQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363785; c=relaxed/simple;
	bh=bsmMPx52RHgNaBJhLQ3QqKnLL+QGkmXiz+/9n067wlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RqwkSLkLEiMWA3bzmLD+NkQCezkI0VHKTGf+vpUfMN5H5eixE5op4FMrdsN/plu+2zn8l3R2C85KNmi5JZ/tg6SOOwGjgioB0Ptj4F7zw6rldHtrYeGraMUGg30Pk6a7aByGb6xHA40t9dlaL2QzibmDbKUZy0Zz9/3TRoUfPLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N2eXgsR7; arc=fail smtp.client-ip=52.101.43.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2eXgsR7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq2fIgwpM+KiHkHk9ODl26bbQhg4kNfhsLlXAQFa8cZfOOoTnv9/Ep8IBj7TVK4dtKZtpd41IFT1BakzzkxUqxZ4+sz3BONnBbuPHk0JXIdskF3nhExbK3ls9RYf3E6GzbfU532c/utGK1d0nBBOUG2EDGqpcjHbD/s5MpnzjpXIO3MY2yDs85IrQSapADNQ+Q5cs/23IutjdWhIWTPIkqPhEnhRlojxE57QWMedQPxSfYvQ40MPacEAx9maG6Tg1dB5KRkcVRirmK+A7alkyBnojnaX7NqjMjeuwlrvmSuRBGBLfFg62PMQiDyyP7/epVFCzyDYPktDs0UzaGgBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3ZCkqH5He4iWapww5d7R/uIfYXhQzSdCI2jQBdbV0k=;
 b=SOY6ZD2WkDXWMKP3s1TTJdEMrh66+FrEFEHohThsw/E8Z3qgaf+YYz0rJY5Yp8d51J2g6YlJT/OB9OgRxkq2YSl72wxnKFZLP/2nqVx9YWPt87yNJgUp8u57q76NHZFCS6Wko91+jKGiIL72B7xX1LHFAfO8lCUk8zvPhH7hwNNGhaZhVY3uhSREjYXvEcB/JSMYiksyd0u5Jgbdu1BlT/Ba/xHnaI1q0O7yDvynfkJvKzV4vDADAX7SJ5S7xHapDsBEFSD8uwSamY7rryQlxiTPkaERgyl/q5+vhTOsSmQsknbT8tYPn4vVHxM4/ibbVB6DyVogDq/p7sK72Ogo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3ZCkqH5He4iWapww5d7R/uIfYXhQzSdCI2jQBdbV0k=;
 b=N2eXgsR7FYng34PGb0A4Pch2DiOjeonv4DGs3DkPU1pbODPVW+NMHJ6TI63lXznwbsY2YvPfilrFv0GSg2MQ89ePO8o+JHwUXcY6ot8p4LCq5UOcYfoXSKiKGZ+N06sf4gkSJy+BYiUWK380BrPv8DBxbRGvfCXelpMx+LP7QRpogxC1ptBs2pe0jg1cT1YJxzPZTJcuMIARIgYKoWm43r/9JYwFcqhyuHy57OVabJHxEZ82N/sFScdyNuG4HOpodFWnIx+8H/6pgHSpUCabfGDEweXDzDHMneDs0G7Y3aFd4/2QPCb2q8BJzxXZ/sVldjGvUQEFw0Rbqt8QBVp93Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:19 +0000
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
Subject: [PATCH v2 27/31] gpu: nova-core: gsp: validate RPC element framing on receive
Date: Fri, 21 Aug 2026 18:54:44 -0700
Message-ID: <20260822015448.238214-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e124ca-53b7-49ab-c29f-08defff08f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9RTRXHop2O/CdKvE72JylPMC8EQVxYV0V6xCKhyKkN8gkU/VAI16On+EUS39OMoldpN8xQyaxDlEPPUyIfX3Rbqb1xUvzU3nc+JemJPOPZVIzWvEIsN1WEX831A8qWehE/h9FsBD4zhvT5VYU9FikrqycoMEnCdbqaQ/iH8o0S8Q464mSVwOX6gj2rX6cElwqb6sfeeyQZwxvoTnYStVwZ0h836QYkkOWe9tPwH0j76tt6aoI6HVCUVUolRjEl+mFy8CyNNXptMZ26r663L+9LBN4Ieo2ZGsWzygCdVlUIBvuVUTzPO1wK+Z6vc3RZNrXPy8D8MAe/aFtEp9u8ZuMUOr7ZMJy82J2oFdG0+ezWdGC9r4GodaUcWmhXoeNgdLUCG85bbHlPk9F7iqRUGU1+5T9lXzGfo8nmtK9lbRvHPrY2en8FOxnpxF0dLSYgD+5mMJV926ZFzI7+17dv6krihajXsT6hekEF6v3HAlbSXK44xiUq17+SmGuLp3a4/piMF0ACogiE6YuCNeOqoL+PP3FfMLvUqJwz2TDjpIX2GMOTMsr2R5EUrLzFkZHxx2lUhONuXQVIj+Z+2YkDNLweTswwW7Acq2/gIz7s5FZv9IwQ8MblwwvMxcpSEuRlqyks5BhgPqpRmbkr5q+9XpRVBJmyTe2mNTAejDzPsE1ao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fpLyh43iqL8CrKe/v39+La7bRU400YVDgos4TZnjFponooMfOKKWywhtxv1T?=
 =?us-ascii?Q?undz7fgHvg1eeqlDqbn5JdB3+sboYmj8J4I797HslUldGvJ+KxLmoQhKtBnW?=
 =?us-ascii?Q?1tFKrg9bNnuZJklr5pOMe+hpH5/txzb13yiOAFlXW5dmAhxsZbbAYLtnx5VT?=
 =?us-ascii?Q?SUsUlaSNq72y6TShM1jV85ASNnn77c/36CXjiCiYriKHXbIgBbhlzkuwjZmP?=
 =?us-ascii?Q?62qVq/1z0lh1Ch2nbX3OLvyAsegojBhHJRcnI6I2TwsD6JeYZn/GUfbyNpP4?=
 =?us-ascii?Q?WfuypafcXSkRtu8I9ydjqdfg7gaoNg2ICopSJpQNuGFed+rmi8w23wvK+fQa?=
 =?us-ascii?Q?C4T1KhmNiU3Kz3nJKcm9FYZR9FabK7ZN/On9AiHvzGVWnscXIz5xDQ/PezT6?=
 =?us-ascii?Q?0c2DcrdNHoYqeyjfesirjyi1gXla4f2d1Ujmm0Vs7w5UTY6s+ra/iuNWGBOf?=
 =?us-ascii?Q?7T4YkyR9T50XYeOHCsFfawF6HIHelDJbLhHtkDHs6N9E9Qf3CrZpFq+XYnRF?=
 =?us-ascii?Q?7AVHPHXXwE5GeS+u8cSiZlyswsoL2xmYgeP72W8CkGsKDYpXWsPAtPc3w6xE?=
 =?us-ascii?Q?p6K/5JkrIk4eWur3K+luhnJgynp5GwjcQHSIP8gvfS2+XXX0bVJbP7c/cbDF?=
 =?us-ascii?Q?1h1VQ9Pm7xIbvd3ZTVHuHlDQSEEEi49tlIficxp/ssD6q0+SVAgY4cMw91MZ?=
 =?us-ascii?Q?XceqZ3/kdmoFkF2pt11iJyTc0YEq1wPfK2oJUog9gXQ33Fj6+XOZjoOhn/Pj?=
 =?us-ascii?Q?PE+toDWqPZ2VMYv4W2ZBJ/PiD9J33yRQKN5hbhnKTTc3m32SHpGNWkvLlffs?=
 =?us-ascii?Q?HMF+mnLxBwDquO9lEyWJodd8fGeTmQnyUKhZbMm8uT+jL1rJfyqhDMs6QFFG?=
 =?us-ascii?Q?fcM+mfJxF36dWI/6dq/vabV1zx5RI7yOA4Q+thU6NhsTWox+TgQkSWJx7tON?=
 =?us-ascii?Q?QwsRL6FFSdAoYNb9lW/vF9fEkr4j0SE5l/8G1Soct+NQQRF1+Q2bh5u+6ybT?=
 =?us-ascii?Q?QWO1SKJoqmozehJXni2ZjL86cYyeRX7GGYQTb+PdA/5jH1QW+gPZZHH94dGZ?=
 =?us-ascii?Q?cmvyDnDbyUnkcugDqEYl/rXkaJ2X8BiXLK7fFQVM92opYSi4Yz/nMkDcXFVI?=
 =?us-ascii?Q?KZfJ1kWcfoBiTN8BNdWVeFhVhqdl5OvSli7KdEbgesd5toDE8dNGm9wTlR78?=
 =?us-ascii?Q?ZzDC8k7a/3wTU9+qw03VrJk6iZXHU0EeePGHsLJd3cb/oZ5Rlwyew1QjL6uH?=
 =?us-ascii?Q?0tQeCmO6Z1igh4xV4q/hkDLugWg0UpzdB0SspYCIkz7E4lKEcMUQXTdLwDQR?=
 =?us-ascii?Q?xCM318jKE2noCcT2MWWgmxWt3OnbFS+hqFKccLnZUA4nkBN1D3qKXSm7n9Lr?=
 =?us-ascii?Q?jdaVEQgeS+sWbiJHY8SE3jqTrvn919ExcsIN504eku10DsckOejr3Puay1Am?=
 =?us-ascii?Q?fib3ct6JFVrQWxHb4xLwRpTZxs1vruDH7RqOyDHhEOOyGfPJHJnUVobMsP5C?=
 =?us-ascii?Q?1pDsyzLHbtYxEP4v8nSsTj9Pk6V33TEJUxmRKwj2/Zis0B+jGTZwTKYpI390?=
 =?us-ascii?Q?bUakT9ys442KMtA8ObB98CkSUPnEWiow316rSdAHUV+Twtxg/+atQ4sFbZTk?=
 =?us-ascii?Q?WX6vInAI6LQGgk/2QoD0s01ylr/1MeacG6gUyiyoCaQfraMPD2SZrJ/0wtOB?=
 =?us-ascii?Q?xh+DkbTGU3B7IsZN5YhHHXuOSk84AgC9E+7GwfavvwQ9xgsPiWz9fksJx3o7?=
 =?us-ascii?Q?1cB4G6FWXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e124ca-53b7-49ab-c29f-08defff08f52
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:19.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4us+eUfmSbW68PqTfubaBtGHhAh6oEPokZKWr8X/aYBNGwhYqLWNC9IjXnMHZRtwDmsVh+ZXUT+NRyHjc6RYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 firmware gives RPC and GMC queue elements the same MCTP and
NVDM transport headers, and the driver advances the read pointer by the
element length those headers declare.

The RPC receive path checked only the MCTP magic, and only after it had
already sliced the payload using a length from the same unchecked
header. Nothing bounded the element length that advances the read
pointer, so a corrupt one moved the pointer to an arbitrary slot.

Run the RPC path through the same framing validation the GMC path uses,
before any length field is read.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 22 ++++++++++++----------
 drivers/gpu/nova-core/gsp/fw.rs   | 17 ++++++++++++++---
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 7a25ab936db9..fb7f000a5a7d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -946,6 +946,18 @@ fn wait_for_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GspMessage<'_>>
             return Err(EIO);
         };
 
+        // Checked before any length field is read, since bad framing leaves them untrusted.
+        if let Err(e) = header.validate_framing() {
+            dev_err!(
+                &self.dev,
+                "GSP RPC: receive: Call {} - bad MCTP framing, declared length {}\n",
+                header.sequence(),
+                header.length(),
+            );
+            self.poisoned.set(true);
+            return Err(e);
+        }
+
         let payload_length = header.payload_length();
 
         // Check that the driver read area is large enough for the message.
@@ -967,16 +979,6 @@ fn wait_for_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GspMessage<'_>>
             )
         };
 
-        if !header.has_valid_magic() {
-            dev_err!(
-                &self.dev,
-                "GSP RPC: receive: Call {} - bad MCTP magic\n",
-                header.sequence()
-            );
-            self.poisoned.set(true);
-            return Err(EIO);
-        }
-
         Ok(GspMessage {
             header,
             contents: (slice_1, slice_2),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index fe06da85fd43..53681b2267c0 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -574,9 +574,20 @@ pub(crate) fn length(&self) -> usize {
         num::u32_as_usize(self.mctp_payload_size)
     }
 
-    /// Returns `true` if the MCTP magic field contains the expected value.
-    pub(crate) fn has_valid_magic(&self) -> bool {
-        self.mctp_magic == MCTP_MAGIC
+    /// Validates the transport framing, before any length field in the element is trusted.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the MCTP magic, the MCTP version, the NVDM vendor id, or the declared element
+    ///   length is not one this driver accepts.
+    pub(crate) fn validate_framing(&self) -> Result {
+        validate_mctp_framing(
+            self.mctp_magic,
+            self.mctp_payload_size,
+            self.mctp_header,
+            self.nvdm_header,
+            size_of::<Self>(),
+        )
     }
 
     // Returns the sequence number of the message.
-- 
2.55.0

