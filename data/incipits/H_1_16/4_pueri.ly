\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    <d a' f'>8[ r <cis e a> r <f d' a'>] r r4
    <f' a, d,>8[ r <g c,! e,> r <a c, f,>] r r4
    <g c, e,>8[ r <f h, d,> r <e g, c,>] r r16 g e c
    a8 a r16 a' f d cis8 d e f
    e16 a, cis e a8 fis d g c, f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    <d a' f'>8[ r <cis e a> r <f d' a'>] r r4
    <f' a, d,>8[ r <g c,! e,> r <a c, f,>] r r4
    <g c, e,>8[ r <f h, d,> r <e g, c,>] r r4
    r16 f c a f8 f e a4 d8
    cis4 r16 d, fis a b8 c a8.\trill a16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 a'^\solo a16[ cis] e[ g] f8 e16 d e8. e16
    d4 r r2
    r r8 g,^\tutti c c
    a a d d cis d e[ d]
    cis cis d d16 d b8 c? a8. a16
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num:
  A so -- lis
  or -- tu us -- que ad oc -- ca --
  sum, lau -- da -- bi -- le no -- men Do -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r4 r8 g'^\solo a f c' b16 a
    g8 f16[ e] f4 e r8 e^\tutti
    f f f f e f a f
    e16 e e e a8 fis g g f f16 f
  }
}

AltoLyrics = \lyricmode {
  Sit no -- men Do -- mi -- ni %2
  be -- ne -- di -- ctum, Ex --
  cel -- sus su -- per o -- mnes gen -- tes
  Do -- mi -- nus, et su -- per coe -- los glo -- ri -- a
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r2 r8 d^\solo d cis
    d16[ f] e[ d] c8.\trill b16 a4 r
    r8 c h16[ c] d8 g, g r c~^\tutti
    c a a a a2
    a8 a a16 a d8 d c! c8. c16
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te
  no -- men Do -- mi -- ni.
  A so -- lis or -- tu us --
  que ad oc -- ca --
  sum, lau -- da -- bi -- le no -- men Do -- "mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r2 f8^\solo d a b
    c c16 c d8. d16 c4 r8 c^\tutti
    f f d d a' f cis d
    a a r d g e f8. f16
  }
}

BassoLyrics = \lyricmode {
  ex hoc nunc et
  us -- que in sae -- cu -- lum. A
  so -- lis or -- tu us -- que ad oc --
  ca -- sum, no -- _ men Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    d8-\solo f cis a d b' g a
    f d e c! f d a b
    c4 d c r8 c-\tutti
    f f d d a' f cis d
    a a' fis d g e f f,
  }
}

BassFigures = \figuremode {
  r2. <6 5>8 <_+>
  <6>4 <6>2 <6>4
  r <7>8 <6!> r2
  r <_+>8 r4.
  <_+>2 <_->8 <6>4.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
