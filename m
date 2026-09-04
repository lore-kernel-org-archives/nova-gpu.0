Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021087.outbound.protection.outlook.com [52.101.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766E4A1E0E
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529324; cv=fail; b=HTzjA9tpJnuc3GAb+X7jR2phTjyegp3QNa0Jscm5aQLudK9yqASDDbpDAMpdzJi5Oje3IWJ/S922wJa8ol33bYu95ia7uLHcXyiOuUqiHVHykG069rLXReiSwsTEL0IY6Qsem1yiMS70CqPfqGcPEopSKldmHqgNq2S0UrlQWZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529324; c=relaxed/simple;
	bh=4Yj0iq4/v7cQxNpmCRhXLcH41PG1/UzP/YMD0F+zHqQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GA0Q7ntuu/NYfL8tzYv/yfMbfoq83jYnes0bPp3O1u/sbvr1SLErEeXN6tiJacw5OXT5VqqrXsw179gjH12GgZJWEIWXrKn20QLtPEcgyhfvRQx/+vmhxe88DzDCsBOt5uJt/pig/nXqUGSg6owofoscKqjslXdoiem/vBW3Y0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EkZ2nZXz; arc=fail smtp.client-ip=52.101.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EkZ2nZXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4bT6GLUhZ2ICn5o4cVvNPj1TafQb/1bx59Y4X6KaO5fRxtFP5jbec0DNoSCW9PYArkj6LDfo6ehkxM0Vs+xlu7R/yVolT77twpwToIAGzTZa+z15x1Ssa6RcuBGCW4gGVpx9m3SLAiSuT62b8L87QYwBH5mBG5Oea4qNvFOgmuLaPUXwlc0ZCob095hEvWEIJYJU31aA7Ar/yv8Dv6Iq5V100+yg+q5y92nl0WP52Q5IgvrK30OIHtlCFl3xpiXE5V7dIEHU8Q9nv3pyAl8NJ2efwAe+duFXN8JWHkJitSl0IU8uQr8aNMkjLv1zbz1tC7wJZfsqRgY6pF2tQafmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZpn6rMGAHEgdHuV9VWQHW2Kv/DllIabYIrj/JwdzS0=;
 b=PiBEfdECe7TgM05DJ+5tXwsB/gySpQvlbEd1ocVg2dga1VmSyOzIT5ak+F/P6CmAje0PQU4v5s5FV8+lObqJTtfOTJ421lvh816TsaUqhLdrBnbuW6WORqzluecuqyACaLvGqqJD69ZyO/J3sDFufFOZ5QbfgQrD0KfIFDne1c+Sx16xynaBtzqjs3mVyEZpuJPk2HNYVjn8AspQZhrFfnWo9taLk2O6f54j1xP4w+oypyqseVD9iSKRViOTpT84dXEcRmb3mc4Bkyphuyod+PzDidb18uePbBfuuR+hcegimteM+uwbNeDNj0GvvMxxxGQU9c2KlZGVKf+h+akwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZpn6rMGAHEgdHuV9VWQHW2Kv/DllIabYIrj/JwdzS0=;
 b=EkZ2nZXzXbY6YBiQ47DQyi0NZWE7b57j4fKjAxEh4RFwHPB40gS6K+K34jOgzFQ//aZu4OZt+4ytl/bmXYlrBpWd2Q/KqPRcQE3bFWFwASEVBoo0MTKifRS6QRRstZfLxrF3X/B6BiyCghpBEY0Eq/mX7VS5mkw4RiyF9Av66sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1913.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:41:58 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:41:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 14:41:57 +0100
Message-Id: <DL6KQ9S2P8AL.3BU96K936R8PZ@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/14] gpu: nova-core: bound a GSP wait by a single
 deadline
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-11-jhubbard@nvidia.com>
 <DL6HKLWO40GT.33FO5AXO9MDA3@nvidia.com>
 <DL6HUQVA7IDA.26SA4DKY73GPG@garyguo.net>
 <DL6KJ0KDZZSA.2N71SIYKCHIGI@nvidia.com>
In-Reply-To: <DL6KJ0KDZZSA.2N71SIYKCHIGI@nvidia.com>
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1913:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c36f5d2-19fa-4881-2557-08df0a8a4aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|366016|1800799024|4143699003|10067099003|56012099006|18002099003|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info:
	vuDgnjQ/TOEwVNrRWMuSDgPh9bNcl8pmCVg8ZhchgYSNwfOTJJqAfaTuXTjHjsEDpmAF2IXyYPYS+kC1uRh9gfBWYUjHneGPiBCexid8XWxCOIixHFzHUKX3QK0UFrYiuli46S+X1IqeCL7dzw4apjR5rk+/98p+GRsxW9DoUiILidTw72Uzor9NGkr7FuZmi0xm/NZAnnh0+G9gYo4naTqcLO+VJcluRhNE83sc9shuuFb8imud32PSJPa7rFEL210oDXjAcSZL/ZFCpfUSUXXFVUx8/mnT/IX/IDRpUn+Sk5appcIWa4LkIIGnqFnWaKLfC6koCSfhI21g1rLmXJDj4kcUeBoldD1mata8eBeAyPkCbLSWNR3qXubQZ8jmm//3Ayrfb4fBXZQZNDPTtk+jLJLetiEqA5WU2aWsj4kCqgVM0lr/N3GftQnIDaaYW7vj5Wr3cD2H7lLSO62HfwysUqxrYCEU5cJvkJ7B+08+pYadHVFyHb4wHwA65d95emiAjAfHxS6+Ft4OBbb23qx5JBtCJYdL5hPvU7ihUZ2M2ENQB2+IIPngfYXvxb0IYCsCuuChS4PSRRBldYwvANB7Gn2aBqszh5QHUNRzWpmZz+kLoQFW96rVMwRFc8sX8QniE+QgyLLi9bUzULhdIIdwKfo8k97FZS57gfSTNA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(18002099003)(5023799004)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHFEMThuekk3QVFUV09SRmhOWk5WMWZ3THdPb0svY3ltMW5Fa1cyUkcybkVw?=
 =?utf-8?B?RkkxVGVxNjQ5ZytWaFVSdEdaRTlXMUdsSjcxKzhQVWVBdkI3SjRMeUxYVWZX?=
 =?utf-8?B?enUxdWxNa3M4UzhTZWJCempraS9FN0lTQXZmb3hFUTNCVDZvQnNVSy9kdjhu?=
 =?utf-8?B?blcvZVhTZGdSUVZFTThvVTYxZEw2SU9RdVhYRW4wUjFwbDZaQXRLTVROek9z?=
 =?utf-8?B?TUQ1YVg3dWlRUzl6ckRnV3kyWXpMbWpsUTJsVFFDNE50cUdSVTVYc0x4WS91?=
 =?utf-8?B?MUJBcDBUbFByZlJhZEF5Z2p0dzZaYUtCN05oVCthNWpNTnFOcjROWSs1dGlZ?=
 =?utf-8?B?ejRIRUdObDhLemVlc3NDRWFmakt1QXl2ZzUrL04xTUJubXlzeDhmbWJqZERH?=
 =?utf-8?B?TXlTU3l1c0ZCZ3dmSm55ditkWXFFUEZmY2g1RzFaR0FET3JIcnp4STJBWkNh?=
 =?utf-8?B?TnNJMnI1RHdkeVQyeDNjMHpSdG11OG9yQmZmNnZCcUMySkFCSEo0Yy82K2tu?=
 =?utf-8?B?NDROWWdmbmRIRzFwbERSQzhNNEMrdkIvUitIUHhqem1USC95aUlPSk12VEMv?=
 =?utf-8?B?WnRKZXBEQ3UzbC9HVUVSb1VjMVFvL1FVUmk0b2JrdGtDeDliSElDcXgzRjBD?=
 =?utf-8?B?V3E5THN2UytVQ3RQVXA5c00rYitxK1M2dFF4Z1graGZkSkVMUEYwZUU4aU5P?=
 =?utf-8?B?bjV4dDNKbzR6RVNsTWp1ZXJCOVhvSE1RVUY2ZGRnajJRK3ltOFcybm9XYmgx?=
 =?utf-8?B?anhPVkZyeUVQZmU2WklGeGJJYnZMUUlUSnMxdDdGYzJ3SFRrTDVMSzJ4dGsx?=
 =?utf-8?B?a0Fnd2ZzbmIwZzllc3kyUlphT2svWlYwMUtZMThadjFBcU05anNibUxROTVG?=
 =?utf-8?B?K052WUtlWno5N3RUWTFES0VQM3JpM1BTUy82b2FnbmUzS3BhR1BXaGUrc1VO?=
 =?utf-8?B?bGRDYnVUdEFhdWlyNlF4RWhCTDlWUWJNMWQwbTFxT2hOeFFxdEUrNStOREhz?=
 =?utf-8?B?NFZWa0hidnl5SHZDUXhrSGgxQ0pnSnBVU09Hamg3anFyYmtsa2NYdU9yV3pT?=
 =?utf-8?B?SDN2VU1JdFU4K3dUVGdEcFE2aU0zYitSNEVzN3NlMkVsMkQxS0UwcVZSM0hT?=
 =?utf-8?B?ZWo5T2NvcE44cS9ESkxvbTU2cnNwNXZBTE96M21YWE5yYVNyL2E2R1YwcGNY?=
 =?utf-8?B?TklTcnlSV2k1Y0RtOS83UGMyN29ZSXJKNDZxek1KQjRLcEFoZjRRemlzcnJq?=
 =?utf-8?B?NDJWYUcvTUNnNFM2UlZmR2JaSHI5QmFGWFRVOW1jMk9ETGJGU1ozSXZIaWYz?=
 =?utf-8?B?dzJDaVlEMkRUS25FTkFnNkdBbDVpWnlUaDlUbk5YaUtvd2JpNjBBd3lZNEJL?=
 =?utf-8?B?TFlFZzhvUjYxQ2h2RW9CS0Z0ZE51VkxCMkRObTVUV2ZvM0Z3a1NBYXNZVmlm?=
 =?utf-8?B?eml3blFyazN5SDF6OXNSSHJDcm5CZjVZSDdVVUg4Ky9KK3NNdG5YN2h4RFc1?=
 =?utf-8?B?aXd5QUNJSGhzYkRndjFmUDRCZmZUQ1g0TXhoa2hHQmRaQVpUdG1FdVo5MERx?=
 =?utf-8?B?Tm4wR1NmUUVQcmFxSEtSL2lRVTFEQ2QyczY0VGt0eFZHZWk5UWo0Y0YwODdY?=
 =?utf-8?B?dmVwSGdoLzVGM0NxTEFrdFJaVkJEY00zK0xyZEJnSmdjUTFFamdIamlQSjlX?=
 =?utf-8?B?cTdnMlg4ZWRXUEhzWmFWQmZNKzkxcVR2SXhHNUFscXdRbklZeDBZZk1XY0Zp?=
 =?utf-8?B?V1FsYXcrUFBjQ1M5bitkLzZpZnJGeWxET09qZkFWTkFPb1VTQkMzQW9sZ2g5?=
 =?utf-8?B?cWwwZ2hLVndhWk1tR0JjZ3lHeFgwZjNJQ3NCSUpCSnBhQVBpeUNHTk5NWGlC?=
 =?utf-8?B?SFFub3Zka3FqcGlhcFJsalVCUkZvejgzd0QvUkU4MzdPMjluRDhyL1VRd2VV?=
 =?utf-8?B?cW45MFhMQzNMdldxN081OHRORkp5YlNCZng1MzBQR1hFbENVZ0wvRHowdC9G?=
 =?utf-8?B?d2U5RTdld05kekRJY2dCTm1hS1czaWxseHVCVlpHNTlJRXkxa0hhMFA2cEZ1?=
 =?utf-8?B?dDhvOW9ZRFc4R0RCY0FNN3Vid1lVSUgxdWptaUNLVTFnOHM0bjdZZWFoWWIr?=
 =?utf-8?B?SU5TMFg1OWhIY3E3Y2dNdHNkcC9FTXRFMkRySzlRMUlTcUs2VnIzUS9WRHhw?=
 =?utf-8?B?dGcwRnE4TnZKSXdnRmhrbUtubWJrNmRvUXBJQkxmMDhXMzBNQnNhdWx6eGxk?=
 =?utf-8?B?NU9Ya0NUZDJ1U0JGeitGdjdVZTB2U2dCdFRSRXI2WnRRZnFWOHJrcFprcHRs?=
 =?utf-8?B?SVU1TkJUb2crMjNZckZ4WmRweUpvTWtieGVvT2I2ekdYeDlqMDl0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c36f5d2-19fa-4881-2557-08df0a8a4aba
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:41:58.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRcofzlE3x7R0vkOXO5DDBVvbRHcwTBaLew848q81amU5p/3IpCjJJ0wLZX/Bexs5Mb+qiSEZiUKLy+eAgHHdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1913

On Fri Sep 4, 2026 at 2:32 PM BST, Alexandre Courbot wrote:
> On Fri Sep 4, 2026 at 8:26 PM JST, Gary Guo wrote:
>> On Fri Sep 4, 2026 at 12:13 PM BST, Alexandre Courbot wrote:
>>> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
>>> <...>
>>>> @@ -611,15 +621,39 @@ pub(crate) fn send_command_no_wait<M>(&self, bar=
: Bar0<'_>, command: M) -> Resul
>>>>          self.inner.lock().send_command(bar, command)
>>>>      }
>>>> =20
>>>> -    /// Receive a message from the GSP.
>>>> +    /// Waits for an unsolicited GSP event of type `M`, logging any o=
ther event that arrives
>>>> +    /// first.
>>>> +    ///
>>>> +    /// The queue is locked for the whole wait, for up to [`Self::REC=
EIVE_TIMEOUT`], so a
>>>> +    /// concurrent command cannot consume the awaited event.
>>>>      ///
>>>> -    /// See [`CmdqInner::receive_msg`] for details.
>>>> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delt=
a) -> Result<M>
>>>> +    /// # Errors
>>>> +    ///
>>>> +    /// - `ETIMEDOUT` if the event does not arrive within [`Self::REC=
EIVE_TIMEOUT`] of the call,
>>>> +    ///   however many other events arrive while waiting.
>>>> +    /// - `EIO` if the queue is poisoned or a message fails framing o=
r checksum validation (see
>>>> +    ///   [`CmdqInner::wait_for_msg`]).
>>>
>>> Let's not mention private methods in public documentation.
>>>
>>>> +    ///
>>>> +    /// Error codes returned by [`MessageFromGsp::read`] are propagat=
ed as-is.
>>>> +    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
>>>>      where
>>>>          // This allows all error types, including `Infallible`, to be=
 used for `M::InitError`.
>>>>          Error: From<M::InitError>,
>>>>      {
>>>> -        self.inner.lock().receive_msg(timeout)
>>>> +        let mut inner =3D self.inner.lock();
>>>> +
>>>> +        let deadline =3D Instant::<Monotonic>::now() + Self::RECEIVE_=
TIMEOUT;
>>>> +        loop {
>>>> +            let remaining =3D deadline - Instant::<Monotonic>::now();
>>>> +            if remaining.is_negative() {
>>>> +                break Err(ETIMEDOUT);
>>>> +            }
>>>> +            match inner.receive_msg::<M>(remaining) {
>>>> +                Ok(msg) =3D> break Ok(msg),
>>>> +                Err(ERANGE) =3D> continue,
>>>> +                Err(e) =3D> break Err(e),
>>>> +            }
>>>> +        }
>>>
>>> This block and the one from `send_command` are strictly identical - we
>>> should factor them out.
>>>
>>> The right place for this seems to be a new method in `CmdqInner`:
>>>
>>>     fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M> ...
>>>
>>> Then this `await_msg` simply becomes:
>>>
>>>     self.inner.lock().await_msg()
>>>
>>> While `send_command` is simplified to:
>>>
>>>     let mut inner =3D self.inner.lock();
>>>     inner.send_command(bar, command)?;
>>>     inner.await_msg()
>>
>> Unless I misunderstand the GSP code, the unmatched message is not discar=
ded, but
>> rather the caller returns from inner code, and drops the lock so other w=
aiters
>> of GSP message can have a chance to take the inner lock and receive the =
message
>> so then get the non-matched message out of the way. So your suggestion w=
ould
>> cause `await_msg` to never complete in such cases?
>>
>> If my understanding of this is correct, then this code should just be mo=
ved to
>> the outer `receive_msg`, because all callers of it have the same loop an=
d I
>> think it's a wanted behaviour anyway.
>
> I don't really understand what you mean here. There is no concept of
> other waiters at the moment, and `receive_msg` unconditionally advances
> the read pointer. In effect, the queue is working in a synchronous
> manner (which is the design of the queue itself, not a Nova limitation)
> so there can be only one expected reply after a message has been
> successfully sent.
>
> I think once we move to the newer firmware we will want to add more
> sophisticated message dispatchers, but for now this simple
> implementation does what we need.

I did misread the `receive_msg` code. I read `Err(ERANGE)` as `Err(ERANGE)?=
` so
I thought the pointer was no incremented in such case.

So everything makes sense to me now.

Best,
Gary

>
> As for my comment, please check with the code - it's really about
> factoring out a block of code without any runtime side-effect.
>
>>
>> BTW, ERANGE is a very bad error code to mean "the message had a recogniz=
ed but
>> non-matching function code".
>
> Maybe we can change this to `ENOMSG`. This will need to be its own patch
> though.


