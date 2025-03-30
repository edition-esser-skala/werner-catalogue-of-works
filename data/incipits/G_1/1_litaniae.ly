\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a'8. a16 cis8 a e' h e gis
    a8. a16 h( a) h8 e,4 r8 a
    fis e4 dis8 e4 r
    R1*2
    r16 e, gis h cis e a cis h gis8 e16 cis e a cis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a'8. a16 cis8 a e' h gis e'~
    e d d8.\trill cis16 cis8 cis a4~
    a8 gis fis8. fis16 gis4 r
    R1*2
    r8 e16 gis a cis8 e16 e,8. gis16 a cis8 e16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    a'8.^\tutti a16 cis8 a e' h r e~
    e d d8. cis16 cis8 cis a4~
    a8 gis fis8. fis16 gis8 h^\solo e h
    cis h cis4\trill h a8 a
    gis gis16 gis a4. gis8 fis4
    gis8 e'^\tutti e e e e e16 e e e
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, Chri --
  ste au -- di nos, Chri -- ste __
  ex -- au -- di nos, Pa -- ter de
  coe -- lis, De -- us, San -- cta
  Tri -- ni -- tas, u -- nus De --
  us, San -- cta Ma -- ri -- a, san -- cta De -- i
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r2 r8 e^\tutti e gis
    fis4 e e r8 fis
    fis e4 dis8 e4 gis8^\solo gis16 gis
    a8 gis a a a16[ gis] gis8 r4
    r8 eis4 fis8 fis e e[ dis]
    e4 r r8 gis^\tutti a e
  }
}

AltoLyrics = \lyricmode {
  Chri -- ste e --
  lei -- _ son, e --
  lei -- _ _ son, Fi -- li, Re --
  dem -- ptor mun -- di, De -- us,
  mi -- se -- re -- re no --
  bis, o -- ra pro
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    cis8.^\tutti cis16 e8 cis h gis4 gis8
    a4 h e, r8 cis'
    h h h8. h16 h4 r
    r8 e4^\solo e16 e e8 e cis([ fis)]
    eis cis4 cis8 h h h4
    h r8 cis^\tutti h e cis4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, Chri --
  ste ex -- au -- di nos,
  Spi -- ri -- tus San -- cte, De --
  us, mi -- se -- re -- re no --
  bis, o -- ra pro "no -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r4 a'^\tutti gis e
    fis gis a r8 fis
    dis e h4 e r
    a8^\solo e cis a e' e r4
    r r8 fis16 fis dis8 e h4
    e r8 a^\tutti gis e r a
  }
}

BassoLyrics = \lyricmode {
  Chri -- ste e --
  lei -- _ son, Chri --
  ste e -- lei -- son,
  mi -- se -- re -- re no -- bis,
  mi -- se -- re -- re no --
  bis, Ma -- ri -- a, pro
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a4-\tutti a' gis e
    fis gis a r8 fis
    dis e h4 e4. e8-\solo
    a e cis a e'4 fis
    cis r8 fis dis e! h4
    e r8 a-\tutti gis e r a
  }
}

BassFigures = \figuremode {
  r1
  <7>8 <6> <5>2.
  <6 5>4 <4>8 <_+> r2
  r8 <5> <6>4 <4>8 <3> <5>4
  <_+>2 <6 5>4 <4>8 <_+>
  r1
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
