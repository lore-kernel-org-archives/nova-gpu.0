Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD7D3C5DB8
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111591; cv=fail; b=DVCPEIpaThvrixtwUZ0/CT1HEFLrmcSFcmY8qRnGkgIiV5ZBL0IW5zOX8vyZPsFU0fBIwbCI54IRP5NtcgVBUUpxYtwTIC8l5e0ILkQf8OH3MVr8ZVtvExQSkRhUmPdjy9t+bM6V/U0R/f66oubGefJQH/DG1bmkT1IYmR+shiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111591; c=relaxed/simple;
	bh=Y2UgdjisiVEGxMSAgLvq0/bdVAoZEqhBuGd2fL7vexE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgtdCZy3X+T6Ilm/PAD06r4ZQaBvRWtLA9S1rbKrAK/izTEyIBKTRQ3R2dr5GFSpLcIw7egK6nHFdGoLo9pqyT8K3hP8d3Mrk2gQoLlDUzRyVlCbmF0s1QWNtJYon2ubVk3+f57T1EsEJw8qVGTKQWYN/RTF/IwPdsGjPAePuZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dr6wF1wI; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dr6wF1wI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsKB1xlNxFaL1H575yUbd2uCfRZbQ8+dI02IWdGFuId4LJuRVmM1YCYHEjopWqdcP95YZAvk+QK5IkEDoSohkMj38jo7lscn/lrgUzHxC8jrqFJdGX5022R8kCoVxm9GjujWLO1CbKf/vh/fx5BMEDJzRK84gCeZrV9UnKfk/m8UxcsGzQHlyRwsztvLcWIham77Lr8VVLEcnntgesipuNo/58qodXhKp4vUHewiLu4pGMXeMQ+/3F3W8zAaR46gMVr75b7xLgo1dke+Q7EPVRux74F/5RIs7wOxJxPj/AYwtsWZ25SSzKgBqyErsCz+KG/GuVNkt3gu2yCZpO+UWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdpkG+03uufGxai8v5njnz1EFfKuObXb5j0ULyBe24c=;
 b=LeeTsZXRxBE2LVO/1qryr06lyoiE6J9m4UTOD5SD/fvRcudcaAryL9b4AqZbKz0r6QGIJmKCoxOW5icq1gAVB9T4SpZmvjoQd0weiOTrPBrmia1x2fskbQI/vNUyP9S1ABHd9UUg/QTzyoMFdtIuscfmLK1tcqVVhObcjlweLWm8jqL08Z4v0YpK0+usRuW3VTbtoKPrMHHf5UeT3L/v75N+GPdbHddo4zX0DpBv4psO462ph9HsllNFQmfzIZMFIh0TuvmI+LegXUOnuxzhlc4V0iCF99SX5BoRwpw7vlz7nB0j8T5vPo8yjJeivF+MRiL8wzpn8ZMLH0GvbcMS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdpkG+03uufGxai8v5njnz1EFfKuObXb5j0ULyBe24c=;
 b=dr6wF1wIMjXDZmHVFHa5jTks3z6LtC0bnaum1A7F1FOdGpdyy552HEKnC2KrHa3Lbf2Hcr3oyLNn5EXrcUtfRrkpK+qnTSxtZSZv78PFd6D15HqTcDSR8TItfW8nrCHFAZMD1VC/z+kt7FTFA5u8DytGNMwnpx5KxCZuZTK7t7ZZQQIBxGkz6BGy4IyWpaP9UEEIlKsLjYi9NbslAD5mfLwUslJ3K1B/nVyNbTDVHbLuhX/1s+vufa+LmQ1Exr9BEGnQWi+DP9CU5IBZjSNRmMvTvDxsje5aR5ZtHG1rvlW7bfCVXaqhZHN3MASl12gCLWHrZnmIi7jfP6s/BaWg4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:50 +0000
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
Subject: [PATCH 23/27] gpu: nova-core: gsp: send GSP_INIT and decode its reply
Date: Tue, 18 Aug 2026 20:52:16 -0700
Message-ID: <20260819035221.336390-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: c98497f9-d862-4c68-06fb-08defda556b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Rz+jJpFpKSuhV2Ba8vXm9BWkVspljtRBHc9MHW5l06oL6pJEiRTm4n4vIrWd0oWZBJBD/OuD26fQCHoosm4XbxymtsDvImwtuzHEegIYkGeb3/yTGEvaveVKMM73Eenn3yzw2rrLltLVCfSDvdVCqQJTbAx+1P2aUfCgZgGG9vezuF9F+Ls2/F7+68QROm4+5gMOQEs64ZKfrtqecMX5JS8UsQNA/g0IVNH018EXqBh5kGEcKoF8ORMrdfSmTy3mjg0VwXjKW2lCHhkGBHLB2nFbU+fdC1ekCh+wA9gJlXGmrwKpPzElzglxtsijiREE4pyUI8JWuPIObx7Mh5MipQLd5w37oetLMSgUguiJQwqZrdnN3Ip2Sl17DReePhXcjYK4fXLH5vEJIS/AnH3TaPDS4krUfaC0Xznf/pOL22Ac2TcH9Wile58rGRodUsIZyp5KFIH7UEFmMLNDD9YJbeXwkp/mPnThiHVekyW+wKeJw8YXUIsDfH6ffW3BaGDgyVqG7OMKyAybEA0s+nZykhTY6Q5zrMpevbC8Ez6eGWnIwUXhqLSl+DSsezRsW7zAlNICeMtFmG6hI6j58FmGfxp+OHCZrbRV5tTdywsWZZXisjGwTrUEMZvGsRzul/QAGL7qNmadgDMQCqSFl5jT/bm2c413Elm6Q0qck7H8ONE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wgirJeRksMaug90tk6i7HH8czA/Vt2INNhQyWGeDVksznVTswvg6VCpKjdwr?=
 =?us-ascii?Q?5PBlvpZcLoHLM9ARgYwxcGzacYy9MmL0rPANX4hN3t2Tqz2PKZ98hP+AyTEa?=
 =?us-ascii?Q?eW7CS4tvugEyza3J5twinzstF6Rc4q4X+pRspaPLfSD0EkMox8MY3q1ZuBe1?=
 =?us-ascii?Q?47kwhaER/LB+QrEKN7xhlPl+zLLu3pUwv6MedduPF0/duxB4T9E19RY1oa5H?=
 =?us-ascii?Q?mS5GT9UqUSNI/AB76MyEw/XgNXpp+yaY4rf9xLNAqSXPYRcxtQFS3Y03XmOO?=
 =?us-ascii?Q?Ess5co6ag0aVloWIxeHz/ljymYqy/sEr37woEbnShpWqQ4JbARISH5Qj8A3D?=
 =?us-ascii?Q?P5UXsBfO1TYwuA24jGC4l2xrknXUGv+xbO673W1Ib2LSvEQ8186MBym54ACu?=
 =?us-ascii?Q?u98a8E93jwfRAAPQDWupE+s4m54H5pZ4v5V26ukgba0GtkLT4/RHyfsPv4Qg?=
 =?us-ascii?Q?9FazP89+BJ+DuH2M2y9LlegQmaiFxWE7QmavWM6/AV9BlbnIeO7L83rjfngX?=
 =?us-ascii?Q?t1sbJahDqy7pRX7YNJmqr4GRO+UvlIE8q23oZlGmS1zHnXqKbi5MgZMPRf/h?=
 =?us-ascii?Q?8YY/1HexDKXAtRahhCwhNJQbWrSRqHIFcVI+kj8cUT0KdC7NMO2AK+CuaxQy?=
 =?us-ascii?Q?Bg1CRiZor3IwuP7P0Tw8hLAfVsT47DfJs6lp/AxfpW8SKTqIxGRMFhfG3ck7?=
 =?us-ascii?Q?N3GWcLxI1d70c1yQyLfVH+f3UDmHWzezLiXJXJ4ZO2d3CsXpxGPAGatxwiJd?=
 =?us-ascii?Q?RRTXtk3RQ4DBpHxUQ86x5u/zHjeume6AJGfmXnj5XUVZ6t7yf3JwGRaUW4ut?=
 =?us-ascii?Q?NMEYbph07OWTaqT0zn2Fcq38T6kEVUtGMARbdcPSwrPEq5pNX9s5mxHyEDMR?=
 =?us-ascii?Q?GFSwI1sdKel8k0OoEkxr4CqGWdTBhPEIP/QPDGesf0KmzGaypRBfUx9g3EKD?=
 =?us-ascii?Q?mM0VFXexZrTI8HTGhZMIrrlNu2+BccPe+AgLM6DMdhe71kKaTQUkwb/HerxV?=
 =?us-ascii?Q?2yK+gFLCKmXn3ZhezG9AbsNjluiebrmShnlVsoitofRAXwMggremZznVGwlB?=
 =?us-ascii?Q?P5hZwzYbaHVgjVCGA+fIzkis5eBi7ISDy8rgvMO9pcTI/qY3z/MB2wsW8Ocj?=
 =?us-ascii?Q?skx85wrTySyX6J1RezoNh0dkd0fCLs6UYaTN7k559BjIRp7xDZPzXTD6wErk?=
 =?us-ascii?Q?vLn5p+Vc4TGXonrYcOEElXayNdCIxIkqT/By0YCONKwvhWsUQ9K4PwUdiFK1?=
 =?us-ascii?Q?AlJ/pF1zuxB6yfm3Tb8iAHEXzNiKXu5oXqnKUgFTFDwVAi7QWMT9w8ysnPPk?=
 =?us-ascii?Q?IuryFvNDsEaiLv5w5S055L+JuR27E1EF0rGF4fD7x4aj7JkUrrcwNp0u1H0m?=
 =?us-ascii?Q?JIwEtg+ooVpjPPZgflWRLUIhhpDwTMEj65qk9yBA90sZWwzGNNmNW6ofsDQg?=
 =?us-ascii?Q?3jSmUdzyJSdZIH8YlOZAYsR1jdhw4SDQCO5VPBxKU3ViS4yh3ydNdzpD7mjc?=
 =?us-ascii?Q?CLAVwP3exQyMEnq13ggwaG3iIcCRQz0K3U27Ky1rwyKizm7VMCdk813nfIgR?=
 =?us-ascii?Q?lG2lwihQ3otqaEMDB7DwLtSfr89iJcDWJQQeDy6gpP2fYrcIZ6DVH9kwpQ4N?=
 =?us-ascii?Q?94xk8XdBUiYO1taEm19WMpeCYmVTlD+uT3NjxX+/wsP7rXK+S7SSihzSymOM?=
 =?us-ascii?Q?0EdBqqtAuWMMirpriOZwaHoHHi6MMWNk3xWaGDvUWtrLEE+Q3qfDCugXWjJo?=
 =?us-ascii?Q?SsV6dk8ccA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98497f9-d862-4c68-06fb-08defda556b6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:50.1013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuvjXAX+glaUrrXlc+47tcQDm36M9dhD49/Gk3zqD/xyyWauzEa2JDQaYdHICzHJ8v4G0qhLK4t5LxbOv/qGgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

GSP-RM answers a GSP_INIT request with the static GPU configuration, and
that reply is also what signals it has finished starting. It raises
load-and-execute events in the meantime, so a caller must handle them
rather than wait through them.

Nova-core can build the request but cannot send it: the GMC sender is
private, and the receive path drops the field carrying the reply status.

Add the sender and the receive-side status field it needs, and decode
the reply into the static-info type the RPC path already produces.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs        |  49 ++++++--
 drivers/gpu/nova-core/gsp/commands.rs    | 140 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs          |   4 +
 drivers/gpu/nova-core/gsp/fw/commands.rs |  35 +++++-
 4 files changed, 213 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 7da61bc9ad92..82ff46620911 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -790,22 +790,43 @@ fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
         self.inner.lock().receive_msg(timeout, None)
     }
 
-    /// Receives one GMC event from the GSP and passes its command id and raw payload slices to
-    /// `handler`.
+    /// Receives one GMC element from the GSP and passes its command id, the `max_resp_or_status`
+    /// field, and the raw payload slices to `handler`.
     ///
     /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
     /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
     ///
     /// See [`CmdqInner::receive_gmc_and_dispatch`] for return values, queue state, and errors.
-    #[expect(dead_code)]
     pub(crate) fn receive_gmc_and_dispatch<R>(
         &self,
         timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
     ) -> Result<Option<R>> {
         self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
     }
 
+    /// Sends a GMC API command to the GSP without waiting for its response.
+    ///
+    /// A caller that expects a response reads it with [`Self::receive_gmc_and_dispatch`], which
+    /// lets it handle the events GSP-RM interleaves before the response arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the command header is not properly aligned.
+    pub(crate) fn send_gmc_no_wait(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result {
+        self.inner
+            .lock()
+            .send_gmc(bar, command_id, payload, max_response_size)
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
@@ -1005,7 +1026,6 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
     /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    #[expect(dead_code)]
     fn send_gmc(
         &mut self,
         bar: Bar0<'_>,
@@ -1383,9 +1403,13 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
 
     /// Receive the next GMC event from the GSP and dispatch it through a handler.
     ///
-    /// The handler receives the GMC command id and the raw payload slices that follow the
-    /// [`super::fw::GmcApiHeader`] (two slices because the circular buffer may wrap). It returns
-    /// `None` for an event it does not handle.
+    /// The handler receives the GMC command id, the header's `max_resp_or_status` field, and the
+    /// raw payload slices that follow the [`super::fw::GmcApiHeader`] (two slices because the
+    /// circular buffer may wrap). It returns `None` for an element it does not handle.
+    ///
+    /// `max_resp_or_status` is a union: GSP-RM writes an `NV_STATUS` there when the element is a
+    /// response, and the maximum response size when it is a request. Only a handler that knows
+    /// which one it asked for can read it.
     ///
     /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this keys on the GMC command id,
     /// which is the form the r000 firmware uses for boot events.
@@ -1401,7 +1425,7 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
     fn receive_gmc_and_dispatch<R>(
         &mut self,
         timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
     ) -> Result<Option<R>> {
         let message = self.wait_for_gmc_msg(timeout)?;
         let header = message.header;
@@ -1420,7 +1444,12 @@ fn receive_gmc_and_dispatch<R>(
                 length,
             );
 
-            handler(command_id, message.contents.0, message.contents.1)
+            handler(
+                command_id,
+                header.gmc.max_resp_or_status,
+                message.contents.0,
+                message.contents.1,
+            )
         } else {
             dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue element\n");
             None
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0c3832ccf726..d55faf1a4e04 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gpu::Chipset,
     gsp::{
         cmdq::{
@@ -32,13 +33,18 @@
             self,
             commands::{
                 GspInitRequest,
+                GspInitResponse,
+                GspInitResponseSchema,
                 RegKey, //
             },
-            MsgFunction, //
+            MsgFunction,
+            GMCAPI_CMD_GSP_INIT, //
         },
         nvkv::{
+            Decoder,
             Encodeable,
-            Encoder, //
+            Encoder,
+            UnknownKeyPolicy, //
         },
     },
     sbuffer::SBufferIter,
@@ -311,6 +317,136 @@ pub(crate) fn build_gsp_init_payload(
     Ok(encoder.finish())
 }
 
+/// Size of the buffer GSP-RM may fill with static configuration, matching the allocation Open RM
+/// makes in `kgspSendInitRpcs`.
+const GSP_INIT_MAX_RESPONSE_SIZE: u32 = 48 * 1024;
+
+/// Sends `GSP_INIT` and returns the static configuration its reply carries.
+///
+/// GSP-RM interleaves load-and-execute events between the request and the reply, and those events
+/// drive the falcon loads that let it finish starting, so each one is passed to `on_boot_event`
+/// rather than skipped. The reply arrives only once GSP-RM is up, which is what makes it the
+/// signal that boot is complete.
+///
+/// `payload` is the blob from [`build_gsp_init_payload`].
+///
+/// # Errors
+///
+/// - `EIO` if GSP-RM reports a failure status, or if the reply is not a whole number of NVKV
+///   words.
+/// - `ETIMEDOUT` if neither the reply nor another element arrives within
+///   [`Cmdq::RECEIVE_TIMEOUT`].
+///
+/// Errors from `on_boot_event` and from decoding the reply are propagated as-is.
+#[expect(dead_code)]
+pub(crate) fn gsp_init(
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    payload: &[u64],
+    mut on_boot_event: impl FnMut(u32, &[u8]) -> Result,
+) -> Result<GetGspStaticInfoReply> {
+    // Qualified because `zerocopy::IntoBytes` also gives `[T]` an `as_bytes`.
+    let payload = AsBytes::as_bytes(payload);
+
+    cmdq.send_gmc_no_wait(
+        bar,
+        GMCAPI_CMD_GSP_INIT,
+        payload,
+        GSP_INIT_MAX_RESPONSE_SIZE,
+    )?;
+
+    loop {
+        let reply = cmdq.receive_gmc_and_dispatch(
+            Cmdq::RECEIVE_TIMEOUT,
+            |command_id, max_resp_or_status, payload_0, payload_1| {
+                if command_id == GMCAPI_CMD_GSP_INIT {
+                    Some(decode_gsp_init_reply(
+                        max_resp_or_status,
+                        payload_0,
+                        payload_1,
+                    ))
+                } else {
+                    // A boot event. Keep waiting for the reply unless handling it failed.
+                    match on_boot_event(command_id, payload_0) {
+                        Ok(()) => None,
+                        Err(e) => Some(Err(e)),
+                    }
+                }
+            },
+        )?;
+
+        if let Some(reply) = reply {
+            return reply;
+        }
+    }
+}
+
+/// Decodes the `GSP_INIT` reply, whose `max_resp_or_status` field carries an `NV_STATUS`.
+fn decode_gsp_init_reply(
+    status: u32,
+    payload_0: &[u8],
+    payload_1: &[u8],
+) -> Result<GetGspStaticInfoReply> {
+    if status != 0 {
+        return Err(EIO);
+    }
+
+    decode_gsp_info(&nvkv_words(payload_0, payload_1)?)
+}
+
+/// Joins the two halves of a wrapped payload into the `u64` words an NVKV stream is made of.
+///
+/// # Errors
+///
+/// - `EIO` if the combined length is not a whole number of words.
+/// - `ENOMEM` if the buffer cannot be allocated.
+fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
+    let bytes = SBufferIter::new_reader([payload_0, payload_1]).flush_into_kvec(GFP_KERNEL)?;
+    let words = bytes.chunks_exact(size_of::<u64>());
+    if !words.remainder().is_empty() {
+        return Err(EIO);
+    }
+
+    let mut out = KVVec::with_capacity(bytes.len() / size_of::<u64>(), GFP_KERNEL)?;
+    for word in words {
+        let word: [u8; size_of::<u64>()] = word.try_into().map_err(|_| EIO)?;
+        out.push(u64::from_le_bytes(word), GFP_KERNEL)?;
+    }
+
+    Ok(out)
+}
+
+/// Decodes the static GPU configuration from an NVKV stream.
+///
+/// # Errors
+///
+/// - `EINVAL` if the stream is malformed or omits a required key.
+/// - `ENOMEM` if the decoded regions cannot be allocated.
+fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
+    let decoder = Decoder::new(words, UnknownKeyPolicy::Ignore);
+    let decoded = KBox::try_init(
+        decoder.decode(GspInitResponseSchema::default())?,
+        GFP_KERNEL,
+    )?;
+
+    let mut gpu_name = [0u8; GspInitResponse::MAX_GPU_NAME_LEN];
+    let name = decoded.gpu_name();
+    gpu_name
+        .get_mut(..name.len())
+        .ok_or(EINVAL)?
+        .copy_from_slice(name);
+
+    let mut usable_fb_regions = KVec::new();
+    for region in decoded.usable_fb_regions() {
+        usable_fb_regions.push(region, GFP_KERNEL)?;
+    }
+
+    Ok(GetGspStaticInfoReply {
+        gpu_name,
+        usable_fb_regions,
+    })
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4772af362117..6958ee3a2e4e 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -979,6 +979,10 @@ pub(crate) struct GmcApiHeader {
 /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC command that hands GSP-RM its system information and registry keys and returns the static
+/// GPU configuration. Its reply is also what signals that GSP-RM has finished starting.
+pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
+
 /// GMC command asking the driver to run the generic falcon bootloader against a descriptor the
 /// GSP supplies.
 pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index bfd756813c64..00e40a435053 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -402,7 +402,7 @@ pub(crate) fn new(
     /// Schema for the `GSP_INIT` response.
     #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
     #[derive(Default)]
-    struct GspInitResponseSchema => GspInitResponse {
+    pub(crate) struct GspInitResponseSchema => GspInitResponse {
         gpu_name:
             Array<u8, { GspInitResponse::MAX_GPU_NAME_LEN }, { Self::GPU_NAME_STRING_KEY }>,
         fb_regions: Accumulated<FbRegionSchema>,
@@ -420,7 +420,7 @@ impl GspInitResponseSchema {
 
 /// Payload of the `GSP_INIT` response.
 #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-struct GspInitResponse {
+pub(crate) struct GspInitResponse {
     gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
@@ -428,7 +428,36 @@ struct GspInitResponse {
 }
 
 impl GspInitResponse {
-    const MAX_GPU_NAME_LEN: usize = 64;
+    pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
+
+    /// A region with no tag is general-purpose memory. A tagged region is reserved for a
+    /// firmware-internal use that the tag identifies.
+    const FB_REGION_TAG_NONE: u32 = 0;
+
+    /// Returns the GPU name, which GSP-RM sends with its NULL terminator.
+    pub(crate) fn gpu_name(&self) -> &[u8] {
+        self.gpu_name.as_slice()
+    }
+
+    /// Iterates over the FB regions the driver may allocate from.
+    ///
+    /// A region qualifies when it is untagged, unprotected, and supports both compression and
+    /// isochronous access, which is the same set the RPC path selects from
+    /// [`GspStaticConfigInfo::usable_fb_regions`].
+    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
+        self.fb_regions.iter().filter_map(|region| {
+            if region.limit >= region.base
+                && region.tag == Self::FB_REGION_TAG_NONE
+                && !region.flags.protected()
+                && region.flags.support_compressed()
+                && region.flags.support_iso()
+            {
+                region.limit.checked_add(1).map(|end| region.base..end)
+            } else {
+                None
+            }
+        })
+    }
 }
 
 nvkv_decode! {
-- 
2.55.0

