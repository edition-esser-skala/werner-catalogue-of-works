\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    e'4.\f a8 gis8. gis16 a8 h
    cis8. d32 cis h8 a \appoggiatura a gis4 a8 cis,
    d h'4 d,8 cis8.\trill d32 e fis16( d) cis( h) \gotoBar "7"
    a4 r r2
    r4 \tuplet 3/2 8 { cis16\f d e } h8 r2
    r r4 \tuplet 3/2 8 { cis16\p d e } h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    r8 cis'\f h a h cis16 d e8 fis16 gis
    a8 e fis8. fis16 h,8 cis16 d e8 a,~
    a gis16 fis gis4\trill a fis8. gis32 a \gotoBar "7"
    a4 r r2
    r4 \tuplet 3/2 8 { a16\f h cis } gis8 r2
    r r4 \tuplet 3/2 8 { a16\p h cis } gis8
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    \after 4*0 ^\markup \remark "Maria, die troſtvolle Mutter"
      R1*3 \gotoBar "7"
    R1*3
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    \after 4*0 ^\markup \remark "Der beängſtigte Sünder"
      R1*3 \gotoBar "7"
    e4 e8 a, gis8. gis16 a8 \tuplet 3/2 8 { h16[ cis d] }
    cis8 h r4 cis8.[ d32 e] e8 a,
    gis8. gis16 a8 \tuplet 3/2 8 { h16[ cis d] } cis8 h r4
  }
}

TenoreLyrics = \lyricmode {
  "1. Ô" Mut -- ter, Mut -- ter mei -- nes
  Her -- ren, du __ wol -- leſt,
  wol -- leſt mich er -- hö -- ren,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a8 a' gis fis e d cis h
    a a' d, fis e d cis fis
    h, d e e, a a' d, fis \gotoBar "7"
    a, a'\p gis fis e d cis h
    a e' r4 a,8 a' gis fis
    e d cis h a e' r4
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>8 <3>4. r4
  <7>8 <6 5> <_+>2.
  r1
  r
  r
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
