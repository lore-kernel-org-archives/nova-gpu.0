Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA53B5307
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693771; cv=fail; b=gqGa2tPqflB+6JTrVuS/QXHmz/wxBAHsDSMt49nAI2T6dAhThoitwiXi89HaRUz4sUzb5Q1pU+if0YgdCUdwDQ9kw1RU4cmV+8Wk4Dc9wbPBQ6i42tnztwAdTicbnuVgf+4l+SE4UaY6Wvuz3TeUzZPVNohTTD4aycJYIn2g7ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693771; c=relaxed/simple;
	bh=e9o1I/8njlndb2PNsI1O1PACBa4d43i/X+KYT/326GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pXv3Y9YoXbtpQtfAjQQ3j0rq7bN5SZF5z1VusB9Upwf6P/oY4QZhhHhHzTVVGyEv8DL6RcFhjMl9coGNNdpNT4JVOGrEuJWpiwjb/LWs0m9hS+/yGaB6A6g5OZ9iKM2voA2MjpMrrQ6vjEC0DW9bR6vzj2fHl5iQpLofR+051oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NPX1OpVp; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NPX1OpVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McVWg1ajdqKthZgPHBUYq8/f+HX+X7C7cvH7zcVclXSUV6jsSGF6doD8fnU4O2Bfhr+7VpHsAfpLM74Sc86dgDBXSE9sudsX9JOctzFY8t5R7n1pikLPUEKDRjI6hpMIS2QmNX/DMhkrsMqb+vOEwmivpqE2d4M650RNlwxPzp28qJmlSlxVCWgExqa0PAY8+SaUNORxyRz7cL1fDdxCrFyGpV51U1P5TtFY2cBAhorfUQdmKgF+qVlyX3iBd/2YhuB42CLm7iua3s1be3B/sz/Gb+HxxhvCz0UoHry4TzjUYWLB9J9LwQiVEQtXN8qjiWL/0UJQCH5MQOFMVwmAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQmaIyeH5MIzbEtOjsdg9zI0uu9zec2dIPtQkUGsBdA=;
 b=bhFIp/B9OVcQv76sCxB/ZMBDPIyJnOE0BRFmzdrmtFix6aNLEX2ObvJ7ANkIWw8jIPo5GQGIhW7kLsn8jRwpkOitvCZ6/pE0DmS+/9QUmtDMuyd0Yq9s/f0Cx6fFn+XuxlrgfLOhM/NxRXDwhQT2iNoRtVkNB8HGlW21dHti8WlzcJ/9WBwmvmYG/bx20hiGHVY1injwGjZ+dEv9zBjZwUoIqwHhxWlXpUOH/rwR4D1hXc+/qM1cMsAgd04D+EwwFqduuTTvpbPw4bm1xcybPjS8W//Z+8pCbu0FIMS8KeYXccy3rJ8ClDSUl+hpQRypyhxp1dm2kGBGcZ6folqeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQmaIyeH5MIzbEtOjsdg9zI0uu9zec2dIPtQkUGsBdA=;
 b=NPX1OpVpbDYo8Ejsv6QnkAWfzBCjwqsEtZpxUFc6BEIjli+pGQqLEuVtIJ6RTcwwWsZXDrvTRl9eFJgwYV77q0dN5KI2fUyo+pZlUsO56DW5AAxFGOIoZ8mYnqujcl6aEIA3XmyYW2iGXmN+HyXPI/1+MzddxAhb1vHbPH78SgmYz8pkJPTwMh5dJV6EKjB3BmXl3JdSRl5rUQ4d6O/LxiHHGiZhFAynouC5whS5Cp1UgFJPHDufrgnge9/FsDsplHrQNidb2y0weonQ7McTZhSK5mpVaBlEHZ+N7zTxMOTkwDaZotA0qUsHOYF4hqaLg3uEjrVkpeth7/shj3w6Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:09:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:09:10 +0000
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
Subject: [PATCH v3 31/33] gpu: nova-core: gsp: split the reply match out of the RPC receive path
Date: Thu, 17 Sep 2026 18:07:17 -0700
Message-ID: <20260918010719.1176945-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f92e9b5-59de-41cb-98b0-08df152149dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	DZO0MkjhXb+ltMSfbboXw/N16Jf4XHN7k+W9T3SqvZdjxVZZdJZ4iDhanB5XBKUh0R8bKm0eatkyyylBbSzrX94yWleK5m7P6WHblihr6VsSadqyRyw2iRfTq76tBS8w/XPCDnL41kDAY2md0SjriO5foTksbzzMHQV7cBDCNo5Fc5Up3cKcIPUdCpwKKpK5384PmXShAdYzt6QweFhX8acQKRfNkzNbf0i8aCHaQ80yvCMxEXkyL4EL28eQ/1fGJ75iqNv+nrv9/pX+9nkFcZ1mrbmrkAoQlkZcD+UxUJbZeNlMcoE6FDObt8sVlxEQi7CXg9jO5U42C2ualhYy5ladtmQ2DpjjYjG8GiV9bnyYbH7lvBxhc18YF/pfUikTHgK5+X5Fe0CeNkB6ncirqNwJvihXSKkfDPsMfPJlPgyDpZbibobTuhk0D7PPIlJUQmfD29mI0FUqBpsMkGOnxOkaXi8bevupykF5910KAnVzIApKyuYKnqWc612/Z/aQ7jq0Uvf2mC8x0PlCcdoa3/o6LRZcDeYPVYYKf4GmshPEgPXC5mxhntj1T1Sn64S3OQ2Rag6t/fu3okrNghOg3DEAYu5V4L05TnwGV36lzsjSfMSyDae7AHTBeaAPThw+d14okmCno8egQ77QQ6dSKl1BhnbXFItQTf3hgONcMOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rQkiCkG/ZpJS+HyV0rD+miBIllBIP5rCnUjWDy6NsWcr/p+N+sFDd/vHq+aW?=
 =?us-ascii?Q?Y/Jby2j6a9vQ5mIxjwuY56UWJyd9U3c4pi6EEtZYrpWGo6xAeLHiSvO5uK6e?=
 =?us-ascii?Q?ycEub4/U6wKBqraC56k/kzD7z00LTmm0YykTBjWskMwOkVO6aVloZtOIahiX?=
 =?us-ascii?Q?ExlxJMACeTxac26W9cvXDpX/ac9wYru4D2nosQ9k165C0VcR/nzkjYqtyDg8?=
 =?us-ascii?Q?kZoFFg97hTxzsnDHrTSVrENzKqsXgGxrXfNd26u/hgMJfR+4THs/N/A0UWeL?=
 =?us-ascii?Q?m4Yuua6L0nJ0Z7lYRxR9d8l6CB4nVoKYIgBxdBJEUCarav4eGtBigKz0PLEP?=
 =?us-ascii?Q?RKLvBTnhMV9QKLTXULJ1Ngt4R4MS3d6OLZiRUVzcfJpGY342Q00ycGfj0LDT?=
 =?us-ascii?Q?Eq+bU8tsXxStt1feWL2l+NiD/Ug3cd7rl7QXF16wbopjv3V+U9UM2mjOMrBo?=
 =?us-ascii?Q?khXc9Y/SqsK2QqO9WaZk6uJn9oRle7dLTHHd9/03UTipHi4iyfJMSzpVMVMv?=
 =?us-ascii?Q?ntWGsHxqs2b/5vvUbVQIn/Qaj4CtChCpSVRj32zIldXMXD/d/dixOKleqjg0?=
 =?us-ascii?Q?L8B+EqSKSccvzhS1lEHlaOs9XD7jSpOJ2Y6EdM1rAgsDpNB5ICKe9TykO7kl?=
 =?us-ascii?Q?3EOwnw/CJKoUoWc8reErXooD1Yz2vKKW+s0tZgRi++bMKvdPdwNTT+ewq6vF?=
 =?us-ascii?Q?4EUKEx5b2qKsigrzx9OYcT6FvcEscQvknyrApx9GLRH43938OGtnFtNAoG8w?=
 =?us-ascii?Q?bdAg+Js5cU4BrL/OuPpFHvZVSaha13PXgNBi+NoroN7S7gUxUidiU/SW+BNQ?=
 =?us-ascii?Q?MTbEsszY4zx8ogS+wFlDi1bdjS/Z4xLyR7dToEyB6D1lWn5kPhNpydTH3g6X?=
 =?us-ascii?Q?kEiSWorcr308phKJ5vnYoExGJql+bStGUsEvUAtKp8spGWDUa3NZsgrhvoMI?=
 =?us-ascii?Q?pcPGoatjuAt4I7ClKOpDrn6C/5tu5ccsxG1g4TEZ639o3r5k3owMmjVib59v?=
 =?us-ascii?Q?jlSCxC++4jrK3V0tQ0F6zNEv/UlHXi2l3Ws/3aFNbthEwbx7eZ/P/eD0ljQV?=
 =?us-ascii?Q?eARe49do8BTAXTdSMC9MaIkYs6xpPAxr00Hw9/nqmbLTxf/q9Bj2IqPvPHyL?=
 =?us-ascii?Q?TBjwf8wXKJQyZpodEvDEBAt60o+G2/fciKSyydZmrm5OpGkx//WPMM0EKEc4?=
 =?us-ascii?Q?YClqAGU2reqxp1UqsrJg4NNNBjuSvuWrDtmrKyYy05U187nE7fmOYOmL9TtI?=
 =?us-ascii?Q?hDS6WYl9GdXsZCQd2TxdDm8wJqqcZduxufluZFxSKlzigILwAbY0dr980/pg?=
 =?us-ascii?Q?kxUq7InUpOsx/7Cbd3DblOMwltiRsWtSNoIdJB4WiPF4MRIhoChRwlwYaYTi?=
 =?us-ascii?Q?LRBOv6VQj6A21+ml8vd4zUcrC31rYTZmJXGf6A6OGkLiW+ACEsxhUZ20yXRf?=
 =?us-ascii?Q?5nQdc6mKcnLylgAnw+By2l7D+DOJo/Ye6AqiLrzmy7yG29kSq26RXyQHR0P+?=
 =?us-ascii?Q?nGKMQrjRG8qBsARdkPPNXCJk8iiJ0ifugZFPbYNLgTNTCSKCE/ovRLMMlMAn?=
 =?us-ascii?Q?O4qiotNxx7AY/kHCUV+bcQtprR0ApFFkJ7r8hUb1XuhcCTMTFwhTc1UusvMo?=
 =?us-ascii?Q?tt6O+r8sZ1owVJu4HVpC8PTdz6gdgOBWcUTIF9IrODXNWkENBv+4sd177Xgr?=
 =?us-ascii?Q?IDfcCvAycp12d8tU1/RmP6VkiAcD6uW/PQ/YHU3Ke4+3fL5F7q3aeXGocSBu?=
 =?us-ascii?Q?mqS2PtYEuA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f92e9b5-59de-41cb-98b0-08df152149dd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:08:02.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rl0M5kvsoqS4xx+inUgIJnl1NJ0xjqhT1PSe9F3rYBI86/5gY8ASJqoD+zYRwj5E24aha46yjEuVP4mynHR3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

GSP-RM posts RPC and GMC messages on one queue, so a receive path has
to decode each element by its kind before it can match an RPC reply.

The RPC receive path matched the reply inline, in the function that
also waited for the element and advanced the read pointer past it. A
dispatch on the element kind in that function would have nested the
whole match one level deeper.

Move the match into a helper of its own, which decodes the awaited
reply or logs the message. The receive path keeps the wait and the
read pointer advance.

The following patch adds the dispatch.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 58 ++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index fc26c7d8aac0..2258c4f2cfd1 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -915,12 +915,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receives a message from the GSP.
     ///
-    /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
-    /// is logged as an event.
-    ///
-    /// With `expected_seq` set, the message must carry that RPC sequence number too. A message
-    /// with the expected function code and a different sequence is a stale reply to a command
-    /// that already timed out, so it is logged and dropped rather than classified as an event.
+    /// [`Self::match_rpc_reply`] decodes the message as the awaited reply of type `M`, or logs it.
+    /// `expected_seq` narrows the match.
     ///
     /// The read pointer advances past the message in every case, including a decode failure.
     ///
@@ -942,13 +938,48 @@ fn receive_msg<M: MessageFromGsp>(
         Error: From<M::InitError>,
     {
         let message = self.wait_for_msg(timeout)?;
+
+        // An early return here would leave the read pointer on this message.
+        let result = self.match_rpc_reply::<M>(&message, expected_seq);
+
+        // Advance the read pointer past this message.
+        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
+            message.header.length().div_ceil(GSP_PAGE_SIZE),
+        )?);
+
+        result
+    }
+
+    /// Decodes `message` as the awaited reply of type `M`, or logs it.
+    ///
+    /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
+    /// is logged as an event.
+    ///
+    /// With `expected_seq` set, the message must carry that RPC sequence number too. A message
+    /// with the expected function code and a different sequence is a stale reply to a command
+    /// that already timed out, so it is logged as stale rather than as an event.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the matched message is too short for `M::Message`.
+    /// - `ENOMSG` if the message is not the awaited reply.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
+    fn match_rpc_reply<M: MessageFromGsp>(
+        &self,
+        message: &GspMessage<'_>,
+        expected_seq: Option<u32>,
+    ) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
         let function = message.header.function();
         let seq = message.header.sequence();
         let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
         let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
-        // An early return here would leave the read pointer on this message.
-        let result = if matched {
+        if matched {
             match M::Message::from_bytes_prefix(message.contents.0) {
                 Some((cmd, contents_1)) => {
                     let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
@@ -984,20 +1015,13 @@ fn receive_msg<M: MessageFromGsp>(
             }
 
             Err(ENOMSG)
-        };
-
-        // Advance the read pointer past this message.
-        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
-            message.header.length().div_ceil(GSP_PAGE_SIZE),
-        )?);
-
-        result
+        }
     }
 
     /// Receives a message of type `M`, waiting up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
     /// Any other message that arrives first is logged as an event and does not extend the
-    /// deadline. `expected_seq` narrows the match as [`Self::receive_msg`] describes.
+    /// deadline. `expected_seq` narrows the match as [`Self::match_rpc_reply`] describes.
     ///
     /// # Errors
     ///
-- 
2.55.0

