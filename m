Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020097.outbound.protection.outlook.com [52.101.195.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7594756CA
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521214; cv=fail; b=RRyJyrIsC1IvNuLoLbjKYEWMb33Ibu8vOQnfs1b7yHpiCEy2T02oQaiMqbZrtzUK+pWJU/RlTYNfWC5TxmJ9MmA18Jt9wguZpLQtyhQXy0cgc28oWd9+Kpjmbp3DP313xGgfGWEF2/1Z/vsR9czDxbw8apQl4G3ZB2eY7vOIAhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521214; c=relaxed/simple;
	bh=xNRNwjkzPaJTCcXCApUL+y784QNzl0cVdJxAUM0XwZs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Cl+0nafmES42z88+CSzwPiNOw36v+ehlGc+ouDt60bchEbmB09jgTQ/cTZHuKUtQ0118aAd3JTbj66z7nvKtBIgB2IE61DAXhGH/r3sqprXdKGOlooPWH/YzmZfnjYQZBCWLiJved51DpYexk/lkAv2XS8ds163zKe7HOboH+8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=e64ZNg4V; arc=fail smtp.client-ip=52.101.195.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="e64ZNg4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muP2KPIfjiS+0tlJ7b9visZCQUV8FAm85XlDjFUP+NP6qlQmaWasZeYIvsZSOeyo1v4XVW+88QIg5h18VcEeMB8k9UMpamg7nZyJ9hOZBDffzM59p90DwR1QpjMdvuk1DXCU3OL7Q8LIqaUKxJUuQgh/8WsiADDSdQNJU+NNVz/3zdjBzbMJZwLXZCNXj1k+HAmqQnfDyPrvCnhl7QSyg8Dpe8QmT7g7mlH5LoOaVQUlWkyfW6udc4WxGSrFI/J0zZhiOoiCQaNvsrzDw5g9g9KbbX8lJzYAV21dQ1XJScaGMvtL6Bu1J6y9UKBJxRN0KQJUUIcWpNDncanuN+R1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFYEcwiKgg1qWeLJFqMp4LtE/MfcAbMDajidF4CZuUY=;
 b=OPlTaVm+Gq/PRtVegDwRGfRqBzMHVi9dl6BncgzWUs/RIrtRwPFOL2TMZ07bBmzXDum/x+lRDKYZQO9/WCJT+eQ1h28W5qIkbg7UQiYMGiIqE002dubNZFJ2VFNv0/po+E2RAYsRWW6YFxWz9X67OPmrMt3ByIfsT9X5w9paTSHUpaQ49GpKHQEwR6nZDVuH7hkV1Ix5PET6Ss2Ec61L39eK4ZqGPXOQ92CXcFPfMoueK3aeLZ20AIBANgMdZBNK8+HK9a87X9MFv1RYaLssLQuu92Rbq9QuC1/X8it57r6ml7Y+ibW4omRfv0SYmWluTDG7yLxIsR/cnTEIdQpEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFYEcwiKgg1qWeLJFqMp4LtE/MfcAbMDajidF4CZuUY=;
 b=e64ZNg4V7bOev1HrYo8GwdYqJ6wsvcXWkmL1inkgXX0XxlIFvARs1ThnY92EBkn5ZHONat+zjp4uG4KZBRFZrL21+yoB0VIg+PS23ZbGRQn9GWUifaSYnIdgciA3pPnN+LOJC0jLfFNO0scvqbc3IMXaBFm8exSXNWMoSFzviC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6247.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:26:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:26:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 12:26:45 +0100
Message-Id: <DL6HUQVA7IDA.26SA4DKY73GPG@garyguo.net>
Subject: Re: [PATCH v3 10/14] gpu: nova-core: bound a GSP wait by a single
 deadline
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-11-jhubbard@nvidia.com>
 <DL6HKLWO40GT.33FO5AXO9MDA3@nvidia.com>
In-Reply-To: <DL6HKLWO40GT.33FO5AXO9MDA3@nvidia.com>
X-ClientProxiedBy: LO4P123CA0124.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5a1bb8-ffb0-427a-4dc9-08df0a776729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10070799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IeGkKz5CLW/Iq4hK8r5CL6Fxl9waKD9N3oT90FIlPAZSMwYpFVhwK/CaG5CPN5u6Vilft7U5iJQH1crqgoGzBgKCCu3qPJ/umTQxI9EsAY1Q4qolyBncZ2iBJxfluVdPkZmSZuh4hZfuK5V4Jy9i9NN2UYWXueWMaU7Pa4fuR6cJfFLltJXTp9y1Q5a+dKLyKxxVp9kB8cR69AuUdW2jRxLaD70UziJqLlBLPyElt/y8+eprr5zu7aPDBOdDy5zmwK+WNywvvalobcYDRFG95g+upvpEZPepOCdv8YXr40BrPF6doccIS1Prue6cdVa3NLe8zDc8KJ3A8pjI+UNGaBxykR+1uOeW56KYu/3NIM3h0/zJsaLZGoDV/BKT7bXZ97464MmvA/5UymUTFLB/xIhmgzpc0WVXHQ5fFi5a4EJksjaUfHhdSx5GCMXbpvMoC2tHOy9DvJlXq9AufuLEg770mdJKfbjW15Z4EmKNj4Sa+4RK4UoVdy4lxlbVkn5NtSyKnj0D2KOgF+UhxoqAWuNuCAwlAd6mR9m9av78XETenpcNOImDe6Cqlw5VQDfZ5pOwZzsPOKsWHs1VfFylpwc+eHnDXxVVBzoMkYvvgEue8u6BKr/XjEGLt9H+onxWV6EFMIRJFSdRO7+kx/oSdQ8I7HUOSuT1ukIyr/Xn44I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10070799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1N4SDl4bWhDNjJkY2xpQThHakpkakhTN3NvcWVLTmF5YkJkaUJVS0xpeVBm?=
 =?utf-8?B?b3doUzJJbnNlMGx3TWlLZkpUdVZXcmZ2RU8rZTFoNUtFWGhmWVFSRXRwazJ4?=
 =?utf-8?B?blN0MUR2ZzFBWkZnenY2R3I2RFRUS3dyZC9tR3hsUkZOU0VOVVhhVlRTWFpF?=
 =?utf-8?B?T0l0YjVQbDE0VUZnUUtqenZwQWd4S3YrM3FFdUZlNVc2TzIxVFNKWHRXTjFr?=
 =?utf-8?B?OEh3TzBjd0JHZytZVDRIdy92UkF5blFnV2plZEsrdmF0Z1pyWGtzd0huQ3Ni?=
 =?utf-8?B?Q0JZQ2JjKzNOR0FvMldIcjNGQ1BGVTBFTVFXdkZmRnNmZjVzbGgyUUNWWHZW?=
 =?utf-8?B?RkdKTWR5OTNTWHFKZEFCYWJkdjFEeWpXMEtIZ3kxdE5OdzhVSGtZL0xGRFU2?=
 =?utf-8?B?cDdHRHdhZW1iK1lhWnRNQ1BtRElaMjBOWWltbTNJYXpMT3lKbTNweUNvMk5T?=
 =?utf-8?B?R1MvVmMyY1NQTEx0emlOSVV0NE5ZeVlYTEtsVnVndnl0cnpjVC8yeEdIREsw?=
 =?utf-8?B?VFNGRjJXYXhJSkVNcVdiU2czNE1QY0ZRTHFhUFNReVkxUmlxTXRKUVJQM2xB?=
 =?utf-8?B?Y2l6T3I0Kzg0UjB3cnIxMStJSnloKy94bjFERTdUMjJqMG8xbU5pbUN1UkN1?=
 =?utf-8?B?MkF1NStGTVlUbUVFS3lCbVdlbHdJbThoTVo3N1ZyRDFpSXRGNG5FS3RENjV0?=
 =?utf-8?B?bmVWN1JRbjRUYlZUejVYQlZ4ZXJuRUhrbDdLWGtwUjROVU81ZW5HTFVPbHVK?=
 =?utf-8?B?T0FJMUtTNkFKVmcrL2s1S0QvYXM2NW4xMDFubFptMlk1U2s3b1NDRWFaUHhs?=
 =?utf-8?B?NVZpcnBXQ2t6TlVYaTdaVU5mYndINlBsMzJYRG1YNkFlREJ4Q0owS09qbGY1?=
 =?utf-8?B?K210S29WK1R2bVVETlFMQVJoVzdpdmduSVV5STFzMlpxWjhSQWJtaG9yZlhE?=
 =?utf-8?B?M3Fyb0lVdTM4amZZaXljcXgzNzFpUG5XK0Z6a1k1YTJ1Q3J5WlpMdU9TODJw?=
 =?utf-8?B?WkF1T1ViTFpIM3IwekgvRTJoZ2FPd0JzMFVJL2Q0ZUJHc2QvYlB3YXFLbS9G?=
 =?utf-8?B?MjZHaU1qM2xSTzluaXZDeFFOMll6MFQwL1k3ODdzRWpNQWpCQytGWnN0UG9L?=
 =?utf-8?B?c2tnQm1TZzZ1S3ZnbWEzckRXditHdHdlWFVpYU1TaW5aR0R2SzdJMU14UW9t?=
 =?utf-8?B?bkNTOVdvVE5OcjU5S1ljRWt3Y2h4NUUrNXc0TCtRK2RIZjVOUHZCSnJ4amgx?=
 =?utf-8?B?VDlJcCtJWGdkNUk5SnNCUisySkdzMjI0ZEd1NUdGTHM1MkRWZG45dE8rTjdH?=
 =?utf-8?B?SkJJN05rYXlsYklKZ2hibEhWdlFHY3E0NVhrM0lRZnd5NXl0ejJYN0o0Zmts?=
 =?utf-8?B?Tml2Wk9pTElQMmZrQ1FBWnJUbmp1ZmFQQmxYeGM1NE05Y001OXZ1Sm9QeDhw?=
 =?utf-8?B?V2VteEJVQ05uWlprYUx4eGp1czdIUUREdXBoQklGWHRnWktqV2o0VEZzYXRl?=
 =?utf-8?B?ZXNRN3lYVGpRK2I4UUZ2WHV2Q3d1RFN4cUM2eXF5T2Q1TkpyU0FzUnR2VFRB?=
 =?utf-8?B?TWJOVHI1Z0Q5cVordE9FdnJpSmhReXFRcHF0SVpVa1pWN2VNcVNMWGF2eldM?=
 =?utf-8?B?R21oa2Q2Zm9lUlFqd2pHM2Q5Z0dRa1V5aU9DUHBhTW1xNitDT0kvN0plU2d1?=
 =?utf-8?B?alV2aEFObjJuaUcvWHIxZnNoV21zZkFJdzAxRS9lSThMbVFWMkZ2aGErbXgv?=
 =?utf-8?B?TW1UQkxOaThDeW54R0lVcTY5TG8vWWtja2ZQeXloT0tNWFlBK2Q4YmtTNUxa?=
 =?utf-8?B?dlozOEI3QXhRWDNJME5xR3NXMTFNRkh1ZTZGK1BaYmhmK3hXSllpRmkremhh?=
 =?utf-8?B?NjduZCtramtaRW1rclBWMnk3T0FXVEI4QWdHdkRlNWMxZFh3c2NnZjlrNGVk?=
 =?utf-8?B?cG4vWWRKVjR1SHZtMkdpNUZadW0xNjUzaVRlZTc1dll3N2U1Y0ZrazUvR0VL?=
 =?utf-8?B?MGJ6RTRNOEZVTFZKUlY0THdhODljSXdKa0pvYjlvdnNIYk54NDBtUlVjV0lD?=
 =?utf-8?B?YWhwRldyU3g5aEMxRkdqWXc3cjV5d3dyMENDMUdtendlOWNzSllYYjJlZmFL?=
 =?utf-8?B?d0VUVldzMk1rWGpBSTMyZHJ6MFYwT2ZDN0pUMUx2QnVQdTlGcHpnWndJRVpN?=
 =?utf-8?B?MlA0UENidy8rbnFuUk5pNmJScWpYdUNJYWtsckd6Y3pmOWhLVWVYclBqcEhx?=
 =?utf-8?B?YU91aGRVTXQrTjNJbWV0djJvRU5ZbWpDUjd5bDg1NWlwQXRrK2xTUHRyZGhq?=
 =?utf-8?B?Mks5MlM2bGtERHBFYkdnK2E1TXRXMmZXd3AvTGpKYTZ3Y1VkNEh4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5a1bb8-ffb0-427a-4dc9-08df0a776729
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:26:45.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdf+4NJ0UOTR7oazIAmdsav7At3bvEFFhCX1yyozT0LC0rqTJe/zdkaNuP67INDTFfUqVajZCAW8N2EeAuD2oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6247

On Fri Sep 4, 2026 at 12:13 PM BST, Alexandre Courbot wrote:
> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> <...>
>> @@ -611,15 +621,39 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: =
Bar0<'_>, command: M) -> Resul
>>          self.inner.lock().send_command(bar, command)
>>      }
>> =20
>> -    /// Receive a message from the GSP.
>> +    /// Waits for an unsolicited GSP event of type `M`, logging any oth=
er event that arrives
>> +    /// first.
>> +    ///
>> +    /// The queue is locked for the whole wait, for up to [`Self::RECEI=
VE_TIMEOUT`], so a
>> +    /// concurrent command cannot consume the awaited event.
>>      ///
>> -    /// See [`CmdqInner::receive_msg`] for details.
>> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta)=
 -> Result<M>
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEI=
VE_TIMEOUT`] of the call,
>> +    ///   however many other events arrive while waiting.
>> +    /// - `EIO` if the queue is poisoned or a message fails framing or =
checksum validation (see
>> +    ///   [`CmdqInner::wait_for_msg`]).
>
> Let's not mention private methods in public documentation.
>
>> +    ///
>> +    /// Error codes returned by [`MessageFromGsp::read`] are propagated=
 as-is.
>> +    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
>>      where
>>          // This allows all error types, including `Infallible`, to be u=
sed for `M::InitError`.
>>          Error: From<M::InitError>,
>>      {
>> -        self.inner.lock().receive_msg(timeout)
>> +        let mut inner =3D self.inner.lock();
>> +
>> +        let deadline =3D Instant::<Monotonic>::now() + Self::RECEIVE_TI=
MEOUT;
>> +        loop {
>> +            let remaining =3D deadline - Instant::<Monotonic>::now();
>> +            if remaining.is_negative() {
>> +                break Err(ETIMEDOUT);
>> +            }
>> +            match inner.receive_msg::<M>(remaining) {
>> +                Ok(msg) =3D> break Ok(msg),
>> +                Err(ERANGE) =3D> continue,
>> +                Err(e) =3D> break Err(e),
>> +            }
>> +        }
>
> This block and the one from `send_command` are strictly identical - we
> should factor them out.
>
> The right place for this seems to be a new method in `CmdqInner`:
>
>     fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M> ...
>
> Then this `await_msg` simply becomes:
>
>     self.inner.lock().await_msg()
>
> While `send_command` is simplified to:
>
>     let mut inner =3D self.inner.lock();
>     inner.send_command(bar, command)?;
>     inner.await_msg()

Unless I misunderstand the GSP code, the unmatched message is not discarded=
, but
rather the caller returns from inner code, and drops the lock so other wait=
ers
of GSP message can have a chance to take the inner lock and receive the mes=
sage
so then get the non-matched message out of the way. So your suggestion woul=
d
cause `await_msg` to never complete in such cases?

If my understanding of this is correct, then this code should just be moved=
 to
the outer `receive_msg`, because all callers of it have the same loop and I
think it's a wanted behaviour anyway.

BTW, ERANGE is a very bad error code to mean "the message had a recognized =
but
non-matching function code".

Best,
Gary

