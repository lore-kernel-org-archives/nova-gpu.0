Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0E316190
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363756; cv=fail; b=uMJFY0pLFktLnORNGN12E+v/cL6K5liMRO8W7wo07fHqKftrV3svZa7rO0mEEuzPbw1CZGqsfo/KL2o7MvMSTBfWh6dnARcRo+0+Y7uJISGAKc+glFNbYAdnW8AaNYvPQiFhwTP2tajB8hduh+JDeMZVNJ2RvockxfSe6gRJukM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363756; c=relaxed/simple;
	bh=JvuPYHVuQrwtQkxDb9brsupYyB8vHAvEyF9r6Eefjvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e//v3GjnBR4dnLiuzDRXP2Z0hr4wd0j8FKiWa06etg4dTpXaZU4LDLx10PosTeKarpo8QVBXe3J1tZ2jBCv44O7TDxueadYvk+DbOZZ41/x6dVvXYN7gzOPCBqurwuHhhxN0phvGvV6CY3zUoENwAUoiDLAAHRSxgG78ItPpBTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sjanX6gC; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjanX6gC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePyJqF33peywX73wpRUaArfQAvR6H1BQS4gInCS2kczNkhzCRdiW9uNiW6RAJlSOv8rWlZGDpOcnSj+iayj6FWRAwhTT8IHU8mfv9eHsdcmRXBjZoTNpy4wRdSKR+XA6TYr9PL4ArclUhRXDo5+j0BQRNLcv3qyqOzV439aGxEDgpgaI+eeY8Iq/a3zf4gHfKh+r+kbEI6JanJN5/dgFqY8mrmXEwgqN55/TT41K59H78rZT6Y5HARlbBPQUjeXd51lwea7fKJbWlrZoS8Z74c0/MqqNK1rF6in4xZeSu4L9UMARVVdXGovus6YOuyLEp19+8GDFVGxP3SiiyP7JOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk/FYOC7buC4yjQiez0H5MqeAR1nQ8yIXxjKo0CrBIs=;
 b=Lb1JbwHcgpLADAjb/ScJL5+HpYeoi29CXUDtfO++wF+3dd++i7Y97poaryrvHyFbJGEsXFi/NcUbbYXd9/6+Uf/0CVGrejXTdnSvC3v2JRI/3Slz/Uji76zHVLIv5xMb0iEfcqD9Swwn1MPjLVu4KE1O5zb2ECf+pKxXSRlSvmz1MYa3jp354rj4xpHvgoN463eZjH8KX5bcM0C4Atccb2A0Tb0Sxr05he7BMVAyvQt8Z33r0x+1yHohJTi7HSXuCQb83UbFJs3Ol0+lIFomk+MKDZAEjAixM8z42s4UTPivyaZlbNFRf9MoqySeYtU8NuM4ebHDWx0hs8Lcb3KHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk/FYOC7buC4yjQiez0H5MqeAR1nQ8yIXxjKo0CrBIs=;
 b=sjanX6gCxteG/HbehYfLrvSwbRUwy3ULysD2INF1DDGAZ7GhNhtBW3i+buu3W17q/POlvS/cWHHN9H8h+mQ0dE0knzgpXB8/feTmx16lHYJfhOTA7aNtvywsSPMnKeSkh7D0hUqKJLs0uWnEHQ6KE8H3/z/aJpK2XXIV/CMmZu3O5ARPHpjqxsaeQg1BI//Mg7MswnyYGwdlZtyKwgUYpg2rMPSOW4TG5cWracJvhXyU+G+qcd9paNjYkDYa8nSknr+AqihlnV0a4Cmq7cy5uqfzp9QFiMfJC7S1kGB4ls1vsUimQ9BIfRMBL96Plt/YxOp3ls5+pHY46iq4AFLPIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:55:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:48 +0000
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
Subject: [PATCH v2 17/31] gpu: nova-core: add GMC transport receive path
Date: Fri, 21 Aug 2026 18:54:34 -0700
Message-ID: <20260822015448.238214-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f1a59b-3ae5-4f88-3361-08defff07cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T+XyrvXEF3DDq/1ZuNEE+HYYyjH+W/TZ0RNF0yz5q1e1GvT54jfnBVfzgxRErYayJ6alNJi2jWDkYB+IrDqB0Xbcq0Gio6fCFtNIuyE2Feyn0A8ONQ4sEZjNIowQLIqNHHlySu681xYIVwVKSGzyRA8zJCdXVv+DVIsEpfmbCWOkJ1PUvwVpIFCIjc2PA7LnLg3rAVDqY+zyG19fk6MTcjEo9szwzhr6qCa24w328oLQRxSKKvf7rB+yFMC7FjcGWxkdQMZa/GIiAGKtl4aiv6CYWZT8buNYz/Iix5vwTAFqJr+kcVIN4HWYfTwY2rYCXCXfkqVmEP1HSR0pem136hP7ZGK8zLSi6zQ3uhdwrRpXeq1stbf8rIsdY3eFdcK7xPsbMf4mQzwRKpiPG67Hmzm4WKJu3zzJIM1dX7Au5YBn17XQZqWv82ZWWWusg0byEU1Fr78nh8Btpl+iycbg+liaLrNPgomufTLzz6T8SHi0wDi8xKaGv8u1dLh+/s5FTlAOQG7gFIAiSaw5C3AQ1EhHXLSAFewDTbv1O60jzxjbaa2lptQHCg+rWAqDDbQVPJ/vO9KWeZLC3uAXPH4aonNXWOPwhUa2PHi7ydlan4zTjUX4OTIl4uVxPSfCnVeuQNXS7yMyqCNEs+ngVb+C0t+td9FHwbGfTrScwPxuLsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17c5raLhBCGF0Smbol8YTcH3gHxfVDX/I5tRyTktc0B626veZOAN3kAF5tGf?=
 =?us-ascii?Q?Zph3LGXQtPByN4xqLnP5/TQaNyP5fUWCdGHJlLmFzkqi+GEbA4AywPVysXXL?=
 =?us-ascii?Q?yjzFD1zZqRdGyUyqoGoNhjb0O22PBanM7i5/xQvCy+mVzt/0mOhYcenJQjb8?=
 =?us-ascii?Q?PLS+0bzYcvtIZTAdNk1Y3gPdHVPQlbBs8bf37Os7Us7Gjgqp19CWaSrUbDol?=
 =?us-ascii?Q?7ll3BTCeAS7+t3hzefY+BaceymNaNZzYvWoAuvmISDzSA0URmN23mtpjnKIr?=
 =?us-ascii?Q?92K96XoNepZBExQYL5Y/BT055QfJYpuIrW384uXJTJGxt51/SY8q75Gi+JUq?=
 =?us-ascii?Q?ZXl9hza1CSyoksDeLEVSO6v0jSM5pRNd66YVWQH37z20UJp8ldim/CO5cJy/?=
 =?us-ascii?Q?Rh64isU4bpB08cvGEI6vNiQUbqasgBd6NPx78u3+Z/y1wLtijr+Qk2JkkuvE?=
 =?us-ascii?Q?WkeTxkSsWeyLgmRLPHZ8xPvhJN481eq25uhN45C8bE2M4/9rdIf6fLflUMEE?=
 =?us-ascii?Q?H9nUEQq5E1Qx5WawTdIkAr7CWYAKzjPTH9QVKMv+A2VS2zbLQXQtpMoeBM3I?=
 =?us-ascii?Q?YdVN3WnAaB5aS6M2puGgbwzNXQpDsjI+F5ZbIFuWk0hI+aEnjrYs5XXMoczu?=
 =?us-ascii?Q?9hxf3KdBOrFJs+EaHbeAA8+onzXoq+KHR2XLasUZsqcLH/YfQglYFFZJNWSp?=
 =?us-ascii?Q?3fEiU1WcRcNDA/YcULJOZ7t+m3BEEHRK5HTFW36qhBmKr84tdXxpGuwXFD2a?=
 =?us-ascii?Q?dUYNbcK+ysrZ6RIvfHjHBbFe4v+sdSXoF/rDNw1RaI/OGY5+/w/ger/hmQor?=
 =?us-ascii?Q?zDBCiYFtLBKBDgB557iq6FdnmUNEfADcgkTGTHS6+sG3pB/YQNPzexjbusTB?=
 =?us-ascii?Q?qg7fxie7cN4/yhf8Tvef6YWQYlKSDQAXKq5/wHLtgruPOJm7NW2Xv/mpeODX?=
 =?us-ascii?Q?z/hex9idzuDB4BqX32J97qed7tsJhurrg2PgZgtESQw/NGVGmZJ65KtLsLME?=
 =?us-ascii?Q?x103fLvzG7UmCTwEIDlmvid7Hx1NCKlCOiRwmn1wwcUhBBBP48r5j+RZEXtD?=
 =?us-ascii?Q?BGhxjrypKc4+33O+2Y2udQTxGHcoWT0lwM8iVf+AgUQCl8UzzIvc/B95Lhtb?=
 =?us-ascii?Q?pSFQ78aeEbRn3Hhykli1ZfMrD6x1/NPoCnIlf4D+/urkasCIHQfDA0lFHyJX?=
 =?us-ascii?Q?qxQGJh8ohf3L0wUInNmoF7fhqaIsuSEZGrjK7e3/b+1JcN+WcH8SlF9FzcVl?=
 =?us-ascii?Q?vABpzxPIWhkzDi0x324ezY6QUKg80VpAPj6lPPe3/yGVJdbgKIyPTZgXkbiF?=
 =?us-ascii?Q?T28yFRMHNztxp6qxql+I9sMzGBbMj3EeXof7mFxqipIS2ZdPZHTfOYlh1cul?=
 =?us-ascii?Q?eNYn+ZZxgTbE0FWqf2Yy1/QP1L11+Neq3+IyXx1Ufh3sNgpc7JpbDNRzL+W4?=
 =?us-ascii?Q?BcEAZLKdgFreHZqXvOkd5fpgiONiX/hx/+ng8l1jgc+vliu+apQKDDZD4pwm?=
 =?us-ascii?Q?MCBtrRTwyrZhWiZCqDm6MRVp4ck8Ys36iaMyhqi+TdGVaxXPOfeAKU1LrL5X?=
 =?us-ascii?Q?tylkeKQxYmWlbjUPSH2zbdHTt59wbkHLMPariSKsSwGMtqOq6x+8FQBAw2pI?=
 =?us-ascii?Q?wrLppoJsBBY0ypZhTw+k4QG1FeBi5o7hSW0TjxMdF0mvLzs0MHJiTZsE2/qL?=
 =?us-ascii?Q?6jbz5zHInNo3w8OLw1jYMqIhFxZHdiNX/CiTsA9KcPgbGkG4JLAw4ihZK1tx?=
 =?us-ascii?Q?i2qpgfpCow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f1a59b-3ae5-4f88-3361-08defff07cac
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:48.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJY/So/clqnPta8nroLJj3FeqJNfMR/8EdlsNFtP99I1lngDTorb86irGuk19T4FMOWT4LHaoW2feKqjxHeqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

GSP-RM posts GMC and RPC messages on the same message queue. Both use
the same MCTP and NVDM transport headers, but RPC messages continue with
rpc_message_header_v and GMC messages continue with GmcApiHeader.
Existing RPC receive code cannot parse the GMC layout.

Add a GMC receive path. It checks the MCTP magic, the MCTP header
version and the NVIDIA vendor id, and requires the declared element
length to lie between the element header size and the maximum queue
element size, matching the checks Open RM makes on arriving elements.

Poison the queue on any of those failures. The read pointer advances by
the declared length, so without a trusted length the driver cannot move
past the element at all.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 87 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 54 +++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs     | 14 ++++-
 3 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6470b1b673b6..96128c418dc9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -629,7 +629,7 @@ struct GspCommand<'a, H = GspMsgElement> {
 
 /// A message ready to be processed from the message queue.
 ///
-/// This is the type returned by [`Cmdq::wait_for_msg`].
+/// This is the type returned by [`CmdqInner::wait_for_msg`].
 struct GspMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspMsgElement,
@@ -638,6 +638,18 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// A GMC message ready to be processed from the message queue.
+///
+/// This is the type returned by [`CmdqInner::wait_for_gmc_msg`].
+#[expect(dead_code)]
+struct GmcMessage<'a> {
+    // Reference to the header of the message.
+    header: &'a GspGmcMsgElement,
+    // Slices of the payload following the `GmcApiHeader`. The second slice is empty unless the
+    // payload wraps around the end of the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -1285,4 +1297,77 @@ fn drain(&mut self) -> Result {
 
         Ok(())
     }
+
+    /// Wait for a GMC message to become available on the message queue.
+    ///
+    /// This is the GMC counterpart to [`Self::wait_for_msg`] and reads the same queue. Like that
+    /// method it works purely at the transport layer, validating the MCTP framing and the
+    /// advertised length and nothing else.
+    ///
+    /// A [`GspGmcMsgElement`] and a [`GspMsgElement`] share every field through `nvdm_header`,
+    /// so a caller that may see either must check the NVDM type before reading `gmc`. Both
+    /// layouts put the element length in the same place, so the caller can advance the read
+    /// pointer past a returned message either way.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if the framing is invalid, or the queue was already poisoned by an earlier such
+    ///   failure. Either failure poisons the queue, so recovery requires a reset.
+    #[expect(dead_code)]
+    fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
+        let (slice_1, slice_2) = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area| !driver_area.0.is_empty(),
+            Delta::from_millis(1),
+            timeout,
+        )
+        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
+
+        let Some((header, slice_1)) = GspGmcMsgElement::from_bytes_prefix(slice_1) else {
+            self.poisoned.set(true);
+            return Err(EIO);
+        };
+
+        // Checked before any length field is read, since bad framing leaves them untrusted.
+        if let Err(e) = header.validate_framing() {
+            dev_err!(
+                &self.dev,
+                "GSP GMC: receive: bad MCTP framing, declared length {}\n",
+                header.length(),
+            );
+            self.poisoned.set(true);
+            return Err(e);
+        }
+
+        let payload_length = header.payload_length();
+
+        // Check that the driver read area is large enough for the message.
+        if slice_1.len() + slice_2.len() < payload_length {
+            self.poisoned.set(true);
+            return Err(EIO);
+        }
+
+        // Cut the message slices down to the actual length of the message.
+        let (slice_1, slice_2) = if slice_1.len() > payload_length {
+            // PANIC: we checked above that `slice_1` is at least as long as `payload_length`.
+            (slice_1.split_at(payload_length).0, &slice_2[0..0])
+        } else {
+            (
+                slice_1,
+                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
+                // large as `payload_length`.
+                slice_2.split_at(payload_length - slice_1.len()).0,
+            )
+        };
+
+        Ok(GmcMessage {
+            header,
+            contents: (slice_1, slice_2),
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 2d7ea46332e6..bbcc2e2b8401 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -955,6 +955,39 @@ unsafe impl FromBytes for GspMsgElement {}
 /// Magic value that opens every MCTP-framed queue element: `"MCTP"` in ASCII.
 const MCTP_MAGIC: u32 = 0x4D43_5450;
 
+/// Validates the MCTP and NVDM framing that opens an MCTP-framed queue element.
+///
+/// `element_size` is the size of the decoded element header, and is the smallest length a
+/// well-formed element can declare.
+///
+/// # Errors
+///
+/// - `EIO` if the magic, the MCTP version or the NVIDIA vendor id is wrong, or if the declared
+///   element length lies outside `element_size..=GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`. The caller
+///   must treat every one of these as leaving the whole element untrusted, its length fields
+///   included.
+fn validate_mctp_framing(
+    magic: u32,
+    mctp_payload_size: u32,
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    element_size: usize,
+) -> Result {
+    if magic != MCTP_MAGIC
+        || !mctp_header.has_expected_version()
+        || !nvdm_header.has_nvidia_vendor()
+    {
+        return Err(EIO);
+    }
+
+    let length = num::u32_as_usize(mctp_payload_size);
+    if length < element_size || length > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+        return Err(EIO);
+    }
+
+    Ok(())
+}
+
 /// GMC API message header.
 ///
 /// Matches the `GMCAPI_HEADER` struct from Open RM. The `command` field carries
@@ -1075,11 +1108,32 @@ pub(crate) fn init(
         })
     }
 
+    /// Returns the length of the response payload (data after the [`GmcApiHeader`]).
+    pub(crate) fn payload_length(&self) -> usize {
+        num::u32_as_usize(self.nvdm_payload_size).saturating_sub(size_of::<GmcApiHeader>())
+    }
+
     /// Returns the total length of the message, transport and GMC headers included.
     pub(crate) fn length(&self) -> usize {
         num::u32_as_usize(self.mctp_payload_size)
     }
 
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
+    }
+
     /// Returns the number of elements (i.e. memory pages) used by this message.
     pub(crate) fn element_count(&self) -> u32 {
         self.mctp_payload_size
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 0ae88bef2a05..5980c356e919 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -67,6 +67,11 @@ pub(crate) fn single_packet() -> Self {
     pub(crate) fn is_single_packet(self) -> bool {
         self.som().into_bool() && self.eom().into_bool()
     }
+
+    /// Returns whether the header carries the MCTP version this driver speaks.
+    pub(crate) fn has_expected_version(self) -> bool {
+        u32::from(self.version()) == Self::VERSION
+    }
 }
 
 /// MCTP message type for PCI vendor-defined messages.
@@ -93,10 +98,15 @@ pub(crate) fn new(nvdm_type: NvdmType) -> Self {
             .with_nvdm_type(nvdm_type)
     }
 
-    /// Validates this header against the expected NVIDIA NVDM format and type.
-    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+    /// Returns whether this is an NVIDIA vendor-defined MCTP message, whatever its NVDM type.
+    pub(crate) fn has_nvidia_vendor(self) -> bool {
         u8::from(self.msg_type()) == MSG_TYPE_VENDOR_PCI
             && u16::from(self.vendor_id()) == Vendor::NVIDIA.as_raw()
+    }
+
+    /// Validates this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.has_nvidia_vendor()
             && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
     }
 }
-- 
2.55.0

