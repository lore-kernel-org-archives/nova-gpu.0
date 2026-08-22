Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6A31ED83
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363759; cv=fail; b=cRg9VAjI0ikFPZoUnI78Q8hrhCHA3V81uSZAYIe37x8s0/bKUJyvxsWyEd7OBZtcGVMLLTzK48u2XgXVu1CgPexGLeNDLXWsfZjs/UN9TFTj3S3Ory/e60TS+24XzqARbeu7EkRJgUK3jNcIv5TDdcZ+LbYcUQufSj039bVRYGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363759; c=relaxed/simple;
	bh=8I+crh5tLVl1kBsntvii1/0RbfbrgO/rpZd0LygD20Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJbsOVawbHiYUgH7CawAMo4m9UiRkJKeM3x27o/7NENtpk/xQ9SXQnnIC0EEoD6IaF54E5zbe5U8/zkDAMDj7KfzTLMXi6ybmVcaJpOGgbViHOWtEuyc8yT6Gg9b8cjrd05y4eQ5pmfCgTBYZ4sccv1BqMoSpp0Ok6CyiHRvRNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eZCDzdDF; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eZCDzdDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gu6fLJq2+7gleU+8M4rWCmvP4dx+jXF6WerKgW1M15Y0Rs82L16CHCvdaa0g6hemPbNHkH6CnUDZfkhZuSFP7kU0CJ0+9l5nRs2XdVS0NxCaLWiP5V4Dm7ebDwiV6MaztyGQ8JS9Rhnh0SH3ZM/IsWfr5fOJUHzZ4rvvtGQHSQKS/3Mv6fC0frrNwEZZ/28uOAYdi+R/YriMluDHZ5hJD/Jgc2+Pfzw7Xfk6cBESDJgZQadfdGN4z5OLHG7/fUjphTKzH1ND1Mv07LBuDfmVknVsLs5lLzOf4Vx1d+b7NQeM/MEdV+Vv9rY6cE5bZygXXf155MdxBolViVIbLGTf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOQ7XDYslJoWLEj/z0LDoBre8kPxjlwCYtHys9ZQ++w=;
 b=FTvjmLyrDdxB7Q1npzFOI3BCGoET+Ar09sPlFhHhuLiNWKVfv5l/pN2W9mgKVg7VB5kLPS+sHwMS99aWbyzAvR4+L7TJjO1e2+lyDoY7NQyhHvNbsRCgRcWwAqrnMZWaqx+GWZXOHoNCBaNEKb8BPhfcRD0BTTpaxQv60I5bVSN8P7HogmPGjYGRiSquVX3nem7fKpEy5OexDUKYXOF9jXDTpBsPgKFQttzqQBx8dPF0Nh5/L5MJx8/7D20L8aQmKOyVRtkFlP3BN3W9pc2EsiMml5B1bLP7TX1ZGZgpSKVtmX/hUlMkJRF7iH0TGBf2UglcCYN/pJnDgunXOthdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOQ7XDYslJoWLEj/z0LDoBre8kPxjlwCYtHys9ZQ++w=;
 b=eZCDzdDFxHzSlJb2TfHN3mvM8vyfZKKg0Pl0BQnKymBVc6aYJxFljh7SzxtyaD7NXzNz0MTSj8zWEmoVAG+xH0X0Gs4FYaADA0TI0GdAZukqe+F42ii2PeDnljTYs+nxPxQiLCgr0i2wpWHGUDsmhI14eoYq/sqcC/iE3JMT8SlWo9/L6NDrDX/9LgS4RG5Zee3fBexEgT3tbPj3/vvaalIJw6OXz2r4u2Q+MJNhfDQ3uNxa9w0fc52/rcIZ5REFKAQKp5Ngiczod/qiV7WOKAFFa5r2yiL3XFpS7I+r+XIuGItThSdyZiUmdlNae9qitG91cowDI5XuKelrR+saeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:55:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:53 +0000
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
Subject: [PATCH v2 18/31] gpu: nova-core: gsp: add GMC dispatch on receive
Date: Fri, 21 Aug 2026 18:54:35 -0700
Message-ID: <20260822015448.238214-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 934ad35d-e00a-4cc2-a712-08defff07fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dZy5JmazAti3jRG6C0lV5tRXo+Z4IDAERWqm+sWcxuSfh0oktsnaI5CB0Zu1tVqBuhpjTpo1Nqvde+EtEDu8ROnEIJdJ3TeBhsE4d0GhK36w1eNFd4N58Axdmlux9FjAIGXjXWyOvCWjpBn/cNhkk6R2YrcuLV6c+++V8gIGMp5NurQ7Eui7k8gJYLF+mOaIj8+J7yo8d5fyx4gTXy9tPiBo72lQ9+ENRVSdfxZdyVXx7hE7SfWBwAYE+zY22g8Vum3K0/oiwyi9t2Un0XX4LBkp2GmABpdcUJHrKdG6NZadgLG8YUIPzPVCfmmaTZYScHlhAqjv08/pvttMM8MfcLz2g2O+/iRp7xxKyU2pM2dBasSEDapDVDPPeQQkkgMAgoWl/BsOBYKTx2+BR6KJ2TNqa5IWMZvMRHjxJSZ4uZNsQm95QKcVHCNeqw2e2ZnAc07kgwCR5vXr+l+pIIGSJPh3Fm+Di4HiiC5+APABjDjd/fkHgb4Siw2jpF2FeJxn/i031GEVKpyhjLWS0rKNlrnI/ByWRRcSRJZhMv3KU/PkjihlCo8zgte7qWogBiB8CshJro1v1QrMTPj8ff94iyUkKMuGgJEXbP0ax3tQsMHjIX4hQFufn7yz1BrOB+Htj7UbTGpKccqTHaS/EOSvwu/gbW15HScsLqO8ZAbKY80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vfWavZUUvjPZuKvlwU/Ry5B2yTuawJY6PIaBpzxG2Lffmw2CUS7EEY76kEQk?=
 =?us-ascii?Q?3baiPXU3OBeHLDOZ8qqxhAspzBFOD5hutQh0CIYHrXWhS5QAUj3N8P3jGkQz?=
 =?us-ascii?Q?8eO+dVWiCjuasP+OzPHnMimCDhXJDxmj3Xd98VC8zEfFg/ftzzcF9qYCf/nq?=
 =?us-ascii?Q?V6aqN7cH0SxPy65Pji/nHjgeB5trM9agLLq8tlsPwtetqnpJ1GhiPKkdOvn8?=
 =?us-ascii?Q?QnI13l/N8kS8uumG3UP67KMyQj1L//9YNQ0rpr/S+8L7Q2IGKKbH7/INSTnW?=
 =?us-ascii?Q?33dy+KdTq6e+UMJniJefS+HqGlSCXj3jcu7A3nARtWok7LCyqyR1wrHJj95Q?=
 =?us-ascii?Q?uIt4zWpdAI4MLvCkV8N4z7miAIJBw7yE4setixUPnUw3DHXcf/tWPoz8DmQu?=
 =?us-ascii?Q?KRO6moF6FTTivcjkyXgqcVE75788KEyaITNpXc/N4VG356RuN0iZ93RohWVW?=
 =?us-ascii?Q?6h5Utu5gUxr8cs2hUnux/ituQcUSWi9IHExtjyZlat5f/Fhg4EIzKSmo/vOK?=
 =?us-ascii?Q?l850W7JzKDFdPIW3PtKRftYifIziHGuqSl5n2/glE7xP6qZ8bbw7TxtcLekl?=
 =?us-ascii?Q?JaF1C+YYf5jibT93ymPhQGb9kYsWN6LUs1cTGbdm37Hmue63LhqYoRPU2Alf?=
 =?us-ascii?Q?8o+EKHS9Nh+jUZwK81bJ26nCkG7SRZTApyKleGPjunn3uULUVNcTeW4acFsf?=
 =?us-ascii?Q?zDBcp/t7R3GRGng5ju3wPtVWqq0l0FGgnRiw6nbxsfDitwy6rjHjpaLPSvyv?=
 =?us-ascii?Q?kBR8NX7mMVihDteDVg4UYslNQsGGM5HekMlp05L8vdXuWkqwJHDAjI33hUKS?=
 =?us-ascii?Q?vdwbBZ5BzDb3b2LwJ/xJyaEM9M8NqGyjhaQi/KvVNoKric2eXMjA+surLidJ?=
 =?us-ascii?Q?m2YbYW3LokZSX9SJwMu9Xgnd1C7snXhwhspXIAX+iffnKwPlPnrYZmlYMwOs?=
 =?us-ascii?Q?kawgZF+Ed4gLJA98/O8zanLYvEPcVOm0v1/9VLEvYuIdfZQ8tthohdhTBveR?=
 =?us-ascii?Q?fBJyqFw96hGOkTSDdtjMxXGSPhwJyddvdsjIuero/r2KN3hRIzkM+8Nb/sHS?=
 =?us-ascii?Q?5R80Q4y1bNb1dSlozIc8FKgtkfAVx1EjUYG+3r+kAfIegJG4smraAXBVpa7p?=
 =?us-ascii?Q?as19L8q61CSFEoGrnTPAexvrIaNKC++0cNwmxYEvRrP/N6L69mahmQxLb88P?=
 =?us-ascii?Q?YFZvha2kvxwd5hwIbhfgx+ezHPh1bmf+OSC7vxqiMBxZROrPTmVNyWVRnJ6M?=
 =?us-ascii?Q?ggfhLYD0W7DuaTYRFb7gYjAD5yMQBbv5R6c1kfgHeIc3tTb23kaUoZyXhv3r?=
 =?us-ascii?Q?fuf6b7tVs3qKvJ8JEzMo1A+Q+Jtma/MywTAYfpv149RVndYhRMEglMgohKPa?=
 =?us-ascii?Q?6YJRpS0AjSYVPD0OwfZ+DciVFcuDupLGXcO60BDiSBiiFbG8DLs/xj1lW/Uh?=
 =?us-ascii?Q?QvWTcS6DWBWOHu16dAz8Jbe5g1UPae4rlUoCci8m15QfskCx891zd5CnHiSr?=
 =?us-ascii?Q?KkGsfjFguUKVMrSP6g7ebtl43n9cP/2PyJZLfrp4M60JQ+SnAzbjGuwmBoO0?=
 =?us-ascii?Q?X9GWNBS7wW0wdg5Z/Wl56XsqY31bCeH3toLiILI3sGBfalWu+vw/2HesWZVn?=
 =?us-ascii?Q?XIBulDrYYz0i1hiGhRw938isAL/SLZvC4+gnvjYSxaqpux72dj6gU+AI1QEK?=
 =?us-ascii?Q?fEYh9rm19PiBf1LLM3xjABID+lPa7XmjrCudeg2eJ7iRSvM3HoOyLnoIijmQ?=
 =?us-ascii?Q?1TJkCyeXIQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934ad35d-e00a-4cc2-a712-08defff07fa6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:53.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCJQ8wCEQtqSXi63vrOG2+4BR7xYQ/j3u0ILeaGrzNJkPoR84IsxqQnX2acM0k6TieBaU4LW3rL7IGiquhda/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 boot path delivers the load-and-execute steps as GMC events
keyed by command id, where the RPC path keys on a function code, so the
boot loop needs its own dispatch.

Add a GMC receive that dispatches on the command id. A GMC element and
an RPC element share every field through the NVDM header, so this checks
the NVDM type before reading the GMC header and drops an element of the
other kind rather than handing the handler a command id decoded from an
RPC header. It also drops an element whose GMC payload size disagrees
with the length the transport header declares, since GSP-RM sends the
two as one length and nothing says which to believe. An element nobody
claims yields Ok(None), and the read pointer advances on every path.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 79 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 20 ++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 96128c418dc9..98d749674df1 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -641,7 +641,6 @@ struct GspMessage<'a> {
 /// A GMC message ready to be processed from the message queue.
 ///
 /// This is the type returned by [`CmdqInner::wait_for_gmc_msg`].
-#[expect(dead_code)]
 struct GmcMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspGmcMsgElement,
@@ -791,6 +790,22 @@ fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
         self.inner.lock().receive_msg(timeout, None)
     }
 
+    /// Receives one GMC event from the GSP and passes its command id and raw payload slices to
+    /// `handler`.
+    ///
+    /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
+    /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
+    ///
+    /// See [`CmdqInner::receive_gmc_and_dispatch`] for return values, queue state, and errors.
+    #[expect(dead_code)]
+    pub(crate) fn receive_gmc_and_dispatch<R>(
+        &self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+    ) -> Result<Option<R>> {
+        self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
@@ -1314,7 +1329,6 @@ fn drain(&mut self) -> Result {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the framing is invalid, or the queue was already poisoned by an earlier such
     ///   failure. Either failure poisons the queue, so recovery requires a reset.
-    #[expect(dead_code)]
     fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
@@ -1370,4 +1384,65 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
             contents: (slice_1, slice_2),
         })
     }
+
+    /// Receive the next GMC event from the GSP and dispatch it through a handler.
+    ///
+    /// The handler receives the GMC command id and the raw payload slices that follow the
+    /// [`super::fw::GmcApiHeader`] (two slices because the circular buffer may wrap). It returns
+    /// `None` for an event it does not handle.
+    ///
+    /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this keys on the GMC command id,
+    /// which is the form the r000 firmware uses for boot events.
+    ///
+    /// Returns `Ok(None)` when nothing claimed the element, either because it is not a GMC
+    /// element or because the handler declined it. The read pointer is advanced on every path.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if the queue is poisoned or the element fails framing validation (see
+    ///   [`Self::wait_for_gmc_msg`]).
+    fn receive_gmc_and_dispatch<R>(
+        &mut self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+    ) -> Result<Option<R>> {
+        let message = self.wait_for_gmc_msg(timeout)?;
+        let header = message.header;
+        let length = header.length();
+
+        // The RPC and GMC elements share every field through `nvdm_header`, so `gmc` holds an
+        // RPC header rather than a GMC one unless the NVDM type says otherwise.
+        let result = if !header.is_gmc_api() {
+            dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue element\n");
+            None
+        } else if num::u32_as_usize(header.gmc.size) != header.payload_length() {
+            // GSP-RM sends the element as the GMC header plus `size` bytes, so the two lengths
+            // describe the same payload and a handler cannot tell which one to believe.
+            dev_err!(
+                &self.dev,
+                "GSP GMC: payload is {} bytes, transport declares {}\n",
+                header.gmc.size,
+                header.payload_length(),
+            );
+            None
+        } else {
+            let command_id = header.gmc.command_id();
+
+            dev_dbg!(
+                &self.dev,
+                "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                header.gmc.sequence,
+                command_id,
+                length,
+            );
+
+            handler(command_id, message.contents.0, message.contents.1)
+        };
+
+        self.gsp_mem
+            .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
+
+        Ok(result)
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index bbcc2e2b8401..31c0e6351fdc 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1008,6 +1008,10 @@ pub(crate) struct GmcApiHeader {
     reserved: [u32; 5],
 }
 
+/// Command identifier bits of [`GmcApiHeader::command`], matching Open RM's
+/// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
+const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
+
 static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
@@ -1030,6 +1034,13 @@ pub(crate) struct GmcApiHeader {
         == core::mem::offset_of!(r000_00::GMCAPI_HEADER, reserved)
 );
 
+impl GmcApiHeader {
+    /// Returns the command identifier, without the flag byte.
+    pub(crate) fn command_id(&self) -> u32 {
+        self.command & GMCAPI_COMMAND_ID_MASK
+    }
+}
+
 // SAFETY: All fields are integer types with no uninitialized padding bytes.
 unsafe impl AsBytes for GmcApiHeader {}
 
@@ -1134,6 +1145,15 @@ pub(crate) fn validate_framing(&self) -> Result {
         )
     }
 
+    /// Returns `true` if the NVDM header routes this element to the GSP's GMC dispatch.
+    ///
+    /// A [`GspMsgElement`] and a [`GspGmcMsgElement`] share every field through `nvdm_header`,
+    /// so the NVDM type is what distinguishes the two on the queue, and `gmc` holds an RPC
+    /// header rather than a GMC one when this returns `false`.
+    pub(crate) fn is_gmc_api(&self) -> bool {
+        self.nvdm_header.validate(NvdmType::GmcApi)
+    }
+
     /// Returns the number of elements (i.e. memory pages) used by this message.
     pub(crate) fn element_count(&self) -> u32 {
         self.mctp_payload_size
-- 
2.55.0

